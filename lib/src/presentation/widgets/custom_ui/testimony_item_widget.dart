import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class TestimonyItemWidget extends StatelessWidget {
  const TestimonyItemWidget({
    super.key, this.name, this.testimony,
  });
  final String? name, testimony;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          shadowColor: !themeProvider.isDarkMode
              ? Colors.grey.withOpacity(.15) : Colors.transparent,
          color: !themeProvider.isDarkMode
              ? const Color(0xFFFFFFFF)
              : const Color(0xFFFFFFFF).withOpacity(.05),
          elevation: 6,

          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme
                                      .of(context)
                                      .highlightColor
                                      .withOpacity(.8)
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  (name ?? '')
                                      .split(' ')
                                      .first
                                      .isEmpty ? 'U' : name!
                                      .split(' ')
                                      .first[0].toUpperCase(),
                                  // 'w',
                                  minFontSize: 13,
                                  maxFontSize: 18,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(name ?? 'ProJob User',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),),
                              const Text('Valued Customer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/images/quote.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        color: themeProvider.isDarkMode ? AppColors.offWhite
                            .withOpacity(.7) : null,)
                    ],
                  ),

                   Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                    child: Text(testimony ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.date_range_outlined, size: 10,),
                            const SizedBox(width: 5,),
                            Text(Util.convertDateFromServerToUI6(
                                DateTime.now()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}