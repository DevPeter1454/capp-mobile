
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ServicesItemWidget extends StatelessWidget {
  const ServicesItemWidget({
    Key? key, required this.onTap, required this.image, required this.serviceName, required this.serviceLocation,
  }) : super(key: key);
  final Function() onTap;
  final String image, serviceName, serviceLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).selectedRowColor,
          // shadowColor: Theme.of(context).highlightColor.withOpacity(.4),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    // shadowColor: Theme.of(context).highlightColor.withOpacity(.4),
                    elevation: 6,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child:
                        Image.network(image,
                          height:  160,
                          width: 160,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Shimmer.fromColors(
                                          baseColor: Colors.grey[400]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: const Material(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                              child: Center(
                                                child: SizedBox(
                                                  width: 160,
                                                  height: 160,
                                                ),
                                              ),
                                            ),
                                          ));
                          },
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return  Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                              child: Center(
                                                  child: SizedBox(
                                                      width: 160,
                                                      height: 160,
                                                      child: Image.asset(
                                                        'assets/images/logo.png',
                                                      ))));
                          },
                        )
                    )
                  ),
                ),
                SizedBox(width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 3, left: 3),
                    child: Text(
                      serviceName ,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 13,
                          child: Icon(
                            Icons.location_pin,
                            size: 10,
                            color: Theme.of(context).primaryColor,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        serviceLocation ?? 'NG',
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                      )
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.amber,size: 15,),
                      SizedBox(width: 4,),
                      Text('4.3 (12.3K Reviews)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                        ),),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
