import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class OtherChoreWidget extends StatelessWidget {
  const OtherChoreWidget({
    super.key, required this.title, required this.desc,
  });
  final String title, desc;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: SizedBox(
          width: size.width * .7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.circle, color: themeProvider.isDarkMode ? Colors.white: Colors.black, size: 7,),
              ),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        color:themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        title,
                      ),
                      TextSpan(
                          text: desc,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}