
import 'package:flutter/material.dart';



class AccountItemCard extends StatelessWidget {
  final String image;
  final String cardText;
  final Function()? cardPressed;

  const AccountItemCard({super.key, required this.image, required this.cardText, this.cardPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // decoration: Constants.cardViewDecoration,
      // child: Center(
      //   child: ListTile(
      //       leading: ImageIcon(
      //         AssetImage(
      //           "assets/images/icons/$image.png",
      //         ),
      //         color: AppColors.darkLilac,
      //       ),
      //       title: Text(
      //         cardText,
      //         style: Constants.boldPrimaryTextStyle,
      //       ),
      //       trailing: Icon(
      //         Icons.keyboard_arrow_right,
      //         color: AppColors.darkLilac,
      //       ),
      //       onTap: (){
      //         cardPressed();
      //       }
      //   ),
      // ),
    );
  }
}
