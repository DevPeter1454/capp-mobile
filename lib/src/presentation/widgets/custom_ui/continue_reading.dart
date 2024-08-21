import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';

class ContinueReading extends StatefulWidget {
  final String content;
  final int maxline;
  final Function()? onClickedContinueReading;
  const ContinueReading(
      {super.key,
      required this.content,
      this.onClickedContinueReading,
      required this.maxline});

  @override
  _ContinueReadingState createState() => _ContinueReadingState();
}

class _ContinueReadingState extends State<ContinueReading> {
  final bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: context.heightPercentage(.80),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var availbleSpacing = constraints.maxHeight;
            final textPainter = TextPainter(
              text: TextSpan(
                text: widget.content,
                style: const TextStyle(color: AppColors.descText),
              ),
              maxLines: _showFullText ? null : widget.maxline,
              textDirection: TextDirection.ltr,
            );
            textPainter.layout(maxWidth: constraints.maxWidth);
            bool isTextOverflowing = textPainter.didExceedMaxLines;
            return SizedBox(
              height: availbleSpacing,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content,
                    maxLines: _showFullText ? null : widget.maxline,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16.0),
                  if (!_showFullText && isTextOverflowing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: widget.onClickedContinueReading,
                          //,
                          child: const Text(
                            'Continue Reading',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
