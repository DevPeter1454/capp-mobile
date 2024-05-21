import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/core/utils/util.dart';
import 'package:capp/presentation/screens/dashboard/main_dashboard_screen.dart';
import 'package:capp/presentation/screens/dashboard/tabs/home/components/services_item_widget.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'components/username_top_header_widget.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> with AutomaticKeepAliveClientMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
       GlobalKey<RefreshIndicatorState>();
  var scaffoldKey =  GlobalKey<ScaffoldState>();
  var searchController = TextEditingController();
  String kyc = '', fullname = '';
  bool showOfflineSubmit = false;
  Map<String, String> artisans = {'assets/images/artisan/hairstylist.png' : 'Hair Services',
    'assets/images/artisan/cleaner.png' : 'Cleaning Services',
  'assets/images/artisan/drycleaner.png' : 'Dry Cleaning Services', 'assets/images/artisan/plumber.png' : 'Plumbing Services'};

  Map<String, String> serviceProviders = {'https://img.freepik.com/free-photo/woman-getting-her-hair-cut-beauty-salon_23-2149167397.jpg' : 'Hair Services',
    'https://www.shutterstock.com/image-photo/female-janitor-cleaning-supplies-kitchen-600nw-1571020054.jpg' : 'Cleaning Services',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSd2SWHOI634hsNSNXPSu2c1XgM6weDYo4uzABBJoO6ejENxad2k0d-htnf3AvLsg4c5c&usqp=CAU' : 'Dry Cleaning Services', 'https://t3.ftcdn.net/jpg/04/80/48/10/360_F_480481061_rld9llq95TvFSMM3vAcacadXeVtiAYa6.jpg' : 'Plumbing Services'};


  Map<String, String> testimonies = {
    'Adewale Lukman': 'I just wanted to share a quick note and let you know that you guys do a really good job.'
        'It\'s really great how easy your app are to update and manage.'
        'I never have any problem at all',
    'Frank Morelles': 'I just wanted to share a quick note and let you know that you guys do a really good job.'
        'It\'s really great how easy your app are to update and manage.'
        'I never have any problem at all',
    'Racheal James' : 'I just wanted to share a quick note and let you know that you guys do a really good job.'
        'It\'s really great how easy your app are to update and manage.'
        'I never have any problem at all',
    'Uchenna Ibong' : 'I just wanted to share a quick note and let you know that you guys do a really good job.'
        'It\'s really great how easy your app are to update and manage.'
        'I never have any problem at all'};

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });
  }


  @override
  void dispose() {
    super.dispose();

  }

  @override
  bool get wantKeepAlive => true;



  @override
  Widget build(BuildContext context) {
    super.build(context);

    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Material(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Theme.of(context).highlightColor,
          onRefresh: () async {
          },
          child: Scaffold(
            key: scaffoldKey,
            body: SingleChildScrollView(
              child: SafeArea(
                bottom: false,
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserNameTopHeaderWidget(
                      onClickedNotificationIcon: () {},
                      onClickedUserAvatar: () {
                        navigationTapped(2);
                      },
                      searchController: searchController,

                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Center(
                        //   child: Text('No available services for now'),
                        // ),
                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20,),
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Our Services',
                                style: TextStyle(fontWeight: FontWeight.w700,
                                    fontSize: 17),),

                              Text('View all',
                                style: TextStyle(fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: artisans.entries.map((e)  {
                                return ArtisanCategoriesItemWidget(
                                  title: e.value,
                                  image: e.key,
                                    onTap: (){

                                      Get.toNamed(RouteConstants.serviceDetails, arguments: e.value);
                                    }
                                );
                              }).toList()
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Top Services',
                                    style: TextStyle(fontWeight: FontWeight.w700,
                                        fontSize: 17),),

                                  Text('View all',
                                    style: TextStyle(fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        fontSize: 12),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: serviceProviders.entries.map((e)  {
                                      return ServicesItemWidget(onTap: (){}, image: e.key, serviceName: e.value, serviceLocation: 'Lagos, NG');
                                    }).toList()
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20,),
                            child:  Text('Testimonies',
                              style: TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: 17),),
                          ),
                          const SizedBox(height: 20,),

                          Center(
                            child: Padding(
                              padding:  const EdgeInsets.only(
                                  bottom: 5, top: 10),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 220,
                                  aspectRatio:28 / 12,
                                  viewportFraction: .8,
                                  initialPage: 1,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: testimonies
                                    .entries
                                    .map(
                                      (e) => TestimonyItemWidget(testimony: e.value, name: e.key,),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .1,)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}



