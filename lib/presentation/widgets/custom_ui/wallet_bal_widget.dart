import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/core/utils/util.dart';
import 'custom_uis.dart';


class WalletBalWidget extends StatelessWidget {
  const WalletBalWidget(
      {Key? key,
        required this.currentBal,
        this.leftBtnState = false,
        this.rightBtnState = false,
        required this.onLeftBtnClicked,
        required this.onRightBtnClicked,
        required this.rightText,
        required this.leftText,
        required this.walletType,
        this.isCrypto = false,
        this.leftBtnPaddingVertical = 20,
        this.rightBtnPaddingVertical = 20, this.color})
      : super(key: key);
  final String currentBal;
  final bool leftBtnState, rightBtnState, isCrypto;
  final Function onLeftBtnClicked, onRightBtnClicked;
  final String rightText, leftText, walletType;
  final double leftBtnPaddingVertical, rightBtnPaddingVertical;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BalContainerWidget(
        boxGradient:  LinearGradient(
            colors: [
              (color ?? Theme.of(context).highlightColor).withOpacity(.95),
              (color ?? Theme.of(context).highlightColor).withOpacity(.6),
              (color ?? Theme.of(context).highlightColor).withOpacity(.8),
            ],
            begin: Alignment.bottomLeft,
            end:Alignment.topRight ,
            stops: const [0.1, 0.6, 1.0],
            tileMode: TileMode.clamp),
        // patternColor: color,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('$walletType Wallet',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Flexible(
                    child: AutoSizeText('${Util.formatMoney(currentBal)} ',
                        maxFontSize: 40,
                        minFontSize: 15,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'CreditFonts',
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w900)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Container(
                // color: Colors.green,
                width: size.width,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: <Widget>[
                    CappCustomButton(
                      isActive: leftBtnState ,
                      onPress: (){
                        onLeftBtnClicked();
                      },
                      hasBorder: true,
                      borderColor: Colors.white,
                      width: size.width * .4,
                      paddingVertical: leftBtnPaddingVertical,
                      child: Text(
                        leftText,
                        style: TextStyle(
                          color: leftBtnState
                              ? Colors.white
                              : Colors.white.withOpacity(.4),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    CappCustomButton(
                      isActive: rightBtnState,
                      onPress: (){
                        onRightBtnClicked();
                      },
                      color: Colors.white,
                      isSolidColor: true,
                      width: size.width * .4,
                      paddingVertical: rightBtnPaddingVertical,
                      child: Text(
                        rightText,
                        style:  TextStyle(
                          color: color ?? Theme.of(context).highlightColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}