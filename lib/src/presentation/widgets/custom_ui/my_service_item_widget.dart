// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
// import 'package:flutter/material.dart';
// import 'package:capp/core/theme/app_colors.dart';
// import 'package:capp/core/utils/util.dart';
//
// import 'custom_uis.dart';
//
//
// class MyServiceItemWidget extends StatelessWidget {
//   const MyServiceItemWidget({
//     super.key, this.onTap, required this.serviceData,
//   });
//   final Function()? onTap;
//   final ServiceRespEntity serviceData;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(14),
//               color: const Color(0xFFFECDD3).withOpacity(.2)
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ImageWidgetWithShimmerLoader(
//                 image: serviceData.imagePaths!
//                     .first,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, top: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(serviceData.name ?? 'Service',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14
//                       ),),
//                     const SizedBox(height: 8,),
//                     Text(
//                         serviceData.serviceTypeName ?? 'Fashion',
//                         style: const TextStyle(
//                             color: AppColors.primary,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400
//
//                         )),
//                     const SizedBox(height: 4,),
//                     Text(
//                         Util.convertDateFromServerToUI3(serviceData.createdAt ?? DateTime.now()),
//                         style: const TextStyle(
//                             color: Color(0xFF535358),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500
//
//                         )),
//                     const SizedBox(height: 15,),
//                     Text(CurrencyTextInputFormatter(
//                         locale: 'en-NG',
//                         decimalDigits: 2,
//                         symbol: '₦ ').format(serviceData.price ??'0'),
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600
//                       ),),
//                     const SizedBox(height: 2,),
//                     Text(
//                         serviceData.servicePromo==null ? 'No Promo': serviceData.servicePromo!.name!,
//                         style: const TextStyle(
//                             color: AppColors.primary,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400
//
//                         ))
//                   ],
//                 ),
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }