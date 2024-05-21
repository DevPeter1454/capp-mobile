import 'package:flutter/material.dart';

class ProceedItemBtnWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final IconData? icon;
  const ProceedItemBtnWidget({
    super.key,  this.onTap, this.title,  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF3F4F8),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                    size: 17,),
                  const SizedBox(width: 15,),
                  Text(title!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, size: 17,),
            ],
          ),
        ),
      ),
    );
  }
}