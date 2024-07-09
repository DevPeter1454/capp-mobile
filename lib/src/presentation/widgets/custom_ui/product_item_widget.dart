// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
// import 'package:flutter/material.dart';
// import 'package:trovexx/core/utils/util.dart';
// import 'package:trovexx/features/profile/mainProfile/domain/entities/response/get_user_product_response_entity.dart';
// import 'package:trovexx/theme/app_theme.dart';
//
// import 'custom_uis.dart';
//
// class ProductsItemWidget extends StatelessWidget {
//   const ProductsItemWidget({
//     super.key,
//     this.data,
//     this.onTap,
//   });
//
//   final ProductRespEntity? data;
//   final Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 10,
//       shadowColor: Colors.black.withOpacity(.1),
//       borderRadius: BorderRadius.circular(10),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(10),
//         splashColor: const Color(0xFFFECDD3).withOpacity(.4),
//         onTap: onTap,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFECDD3).withOpacity(.2),
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10)),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//                       child: Center(
//                           child: ImageWidgetWithShimmerLoader(image: data!.imagePaths!.first,
//                             baseColor: const Color(0xFFFECDD3),
//                             highlightColor: const Color(0xFFFECDD3).withOpacity(.5),
//                             height: 120,
//                             width: 120,
//                           ))),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(left: 4),
//                               child: Icon(
//                                 Icons.star,
//                                 color: AppColors.primary,
//                                 size: 10,
//                               ),
//                             ),
//                             Text(
//                               '4.5',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                               color: const Color(0xFFFECDD3).withOpacity(.6),
//                               shape: BoxShape.circle),
//                           child: Icon(
//                             Icons.favorite_border_outlined,
//                             size: 20,
//                             color: Color(0xFFFD586C),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data!.name ?? 'Product Name',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w400, fontSize: 12),
//                   ),
//                   Text(
//                     data!.condition ?? 'New',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 8,
//                         color: AppColors.descText),
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                        Text(
//                        Util.formatMoney(data!.sellingPrice ?? '0'),
//                         style: const TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.w700),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(3),
//                         decoration: const BoxDecoration(
//                             color: AppColors.primary, shape: BoxShape.circle),
//                         child: const Center(
//                           child: Icon(
//                             Icons.add,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
