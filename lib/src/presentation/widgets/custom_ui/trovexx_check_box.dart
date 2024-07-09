
import 'package:flutter/material.dart';
import 'package:capp/src/theme/app_colors.dart';

class ProJobCheckBoxWidget extends StatelessWidget {
  const ProJobCheckBoxWidget({
    Key? key,
     this.check,
     this.onCheckChanged,
  }) : super(key: key);

  final bool? check;
  final ValueChanged? onCheckChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: check,
        checkColor: AppColors.primary,
        activeColor: AppColors.primary,
        fillColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            }),
        side: MaterialStateBorderSide.resolveWith((states) {
          return const BorderSide(
              color: AppColors.primary, width: 0.5);
        }),
        onChanged: onCheckChanged);
  }
}
