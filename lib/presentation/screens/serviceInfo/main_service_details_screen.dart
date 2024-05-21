
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class MainServiceDetailsScreen extends StatefulWidget {
  final String serviceName;

  const MainServiceDetailsScreen({
        super.key,
    required this.serviceName
      });

  @override
  _MainServiceDetailsScreenState createState() => _MainServiceDetailsScreenState();
}

class _MainServiceDetailsScreenState extends State<MainServiceDetailsScreen> {
  int successfulBookings = 0;
  int serviceTimeCounter = 0; // Counter for service time

  void _showFAQBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    // Add your FAQ content here
                    ListTile(
                      title: Text('Question 1'),
                      subtitle: Text('Answer 1'),
                    ),
                    ListTile(
                      title: Text('Question 2'),
                      subtitle: Text('Answer 2'),
                    ),
                    // Add more ListTile widgets as needed
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(height: 220, width: screenWidth,
                        child: Image.asset(
                          'assets/images/cleantop.jpeg', fit: BoxFit.fill,),
                      ),
                      SafeArea(
                        bottom: false,
                        child: BackArrowWidget(onTap: () {
                          Get.back();
                        },
                          color: Colors.white,),
                      )
                    ],
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      widget.serviceName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Spacing between Service Name and Bookings
                  const SizedBox(height: 5),
                  // Bookings
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 15,),
                        const SizedBox(width: 8),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text:  TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Book so far: ',
                              ),
                              TextSpan(
                                  text: '0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  )
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // FAQ Button
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: CappCustomButton(
                        isActive: true,
                        onPress: () {
                          _showFAQBottomSheet(context);
                        },
                        color: Colors.transparent,
                        hasBorder: true,
                        borderRadius: 8,
                        paddingVertical: 12,
                        borderColor: Colors.grey,
                        borderWidth: 0.5,
                        isSolidColor: true,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.info), // Icon
                              SizedBox(width: 8),
                              Text(
                                'Frequently Asked Questions', // Text
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right), // Greater than sign
                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20,),
                  ServiceItemWidget(

                    onSelectServicePressed: (){
                      Get.toNamed(RouteConstants.makeSchedule);
                    },
                  ),
                  const ServiceItemWidget(),
                  const ServiceItemWidget(),

                ],
              ),
            ),
            // Positioned(
            //     bottom: 0,
            //     child: Container(
            //       width: screenWidth,
            //       padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            //       decoration: BoxDecoration(
            //         color: themeProvider.isDarkMode ? Colors.grey[900]:Colors.white,
            //         borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
            //       ),
            //       child: SafeArea(
            //         top: false,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             const Text('\$230.00',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 16
            //               ),),
            //             ProJobCustomButton(
            //               isActive: true,
            //               onPress: () {},
            //               color: Theme.of(context).highlightColor,
            //               isSolidColor: true,
            //               width: screenWidth * .5,
            //               paddingVertical: 14,
            //               borderRadius: 10,
            //               child: const Text(
            //                 'Proceed To Checkout',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: 14,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ))
          ],
        ),
      );
    });
  }
}

