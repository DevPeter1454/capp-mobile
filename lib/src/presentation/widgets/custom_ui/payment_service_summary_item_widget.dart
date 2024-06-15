import 'package:flutter/material.dart';
import 'package:capp/src/utils/util.dart';


class PaymentSummaryItemWidget extends StatelessWidget {
  const PaymentSummaryItemWidget({
    super.key, this.title, this.amount,
  });
  final String? title, amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title ?? 'Service Total',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),),
          Text(Util.formatMoney(amount ?? '40000'),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),),
        ],
      ),
    );
  }
}