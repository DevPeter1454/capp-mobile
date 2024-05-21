import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'custom_uis.dart';


class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({Key? key, required this.onEditServicePressed}) : super(key: key);
  final Function() onEditServicePressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Material(
              shadowColor: !themeProvider.isDarkMode
                  ? Colors.grey.withOpacity(.15) : Colors.transparent,
              color: !themeProvider.isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFFFFFFFF).withOpacity(.05),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      shadowColor: !themeProvider.isDarkMode
                          ? Colors.grey.withOpacity(.15) : Colors.transparent,
                      color: !themeProvider.isDarkMode
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFFFFFFFF).withOpacity(.05),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),

                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Take Down Hairstyle',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star, color: Colors.amber, size: 15,),
                                      SizedBox(width: 4,),
                                      Text('4.3 (12.3K Reviews)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400
                                        ),),

                                    ],
                                  ),
                                ),
                                Text('1 hrs 30mins',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),),
                              ],
                            ),
                            CappCustomButton(
                              isActive: true,
                              onPress: () {},
                              color: Theme
                                  .of(context)
                                  .highlightColor,
                              // hasBorder: true,
                              width: size.width * .2,
                              borderRadius: 6,
                              paddingVertical: 8,
                              borderColor: Colors.purple,
                              isSolidColor: true,
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          CheckoutAddChoreWidget(
                            title: 'Clothes ironing & folding',
                            amount: '4000',
                            time: '35 mins',
                          ),
                          CheckoutAddChoreWidget(
                            title: 'Bedrooms',
                            amount: '100',
                            time: '25 mins',
                          ),
                          CheckoutAddChoreWidget(
                            title: 'Kitchen',
                            amount: '500',
                            time: '35 mins',
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CappCustomButton(
                        isActive: true,
                        onPress: onEditServicePressed,
                        color: Colors.transparent,
                        hasBorder: true,
                        width: size.width * .37,
                        borderRadius: 8,
                        paddingVertical: 8,
                        borderColor: Theme
                            .of(context)
                            .highlightColor,
                        isSolidColor: true,
                        child: Text(
                          'Edit Service',
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .highlightColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: DottedSeparator(
              height: 0.6,
              color: Colors.grey.withOpacity(.6),
            ),
          )
        ],
      );
    });
  }
}