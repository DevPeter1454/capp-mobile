import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/core/utils/util.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class WalletTransactionItemWidget extends StatelessWidget {
  const WalletTransactionItemWidget({
    super.key,  this.isInflow = false,
  });
  final bool isInflow;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, theme, child)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Material(
          color: theme.isDarkMode ? const Color(0xFFF2F4F3).withOpacity(.1) : Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:!isInflow ?  Colors.redAccent.withOpacity(.2) : Colors.green.withOpacity(.2) ,
                        ),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(6),
                        child: Icon(!isInflow ? Icons.arrow_circle_up_sharp :Icons.arrow_circle_down_sharp,
                          color: !isInflow ?  Colors.redAccent : Colors.green , size: 25,)),
                    SizedBox(
                      width: size.width * .53,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            isInflow ? 'Your main wallet was successfully credit ' : 'You made a withdraw from your main wallet',
                            maxLines: 2,
                            maxFontSize: 13,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 3,),
                          Text(Util.convertDateFromServerToUI4(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text('-\$15.10',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600
                  ),),
              ],
            ),
          ),
        ),
      );
    });
  }
}