
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class UserNameTopHeaderWidget extends StatelessWidget {
    const UserNameTopHeaderWidget({Key? key,  this.onClickedUserAvatar, this.onClickedNotificationIcon, required this.searchController, }) : super(key: key);
  final Function()? onClickedUserAvatar;
   final Function()? onClickedNotificationIcon;
   final TextEditingController searchController;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(
        builder: (context,  theme, child)
        {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            ),
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onClickedUserAvatar,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        // child:  Hero(tag:userData.userId,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * .6,
                                  child: AutoSizeText(
                                    'Hello, ${
                                        ('Azeez Jide').split(' ').first}',
                                    maxLines: 1,
                                    minFontSize: 12,
                                    maxFontSize: 18,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2,),
                                InkWell(
                                  onTap: (){

                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
                                    child: SizedBox(
                                      width: size.width * .75,
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_pin, color: Theme.of(context).highlightColor, size: 13,),
                                          SizedBox(width: 3,),
                                          Flexible(
                                            child: const AutoSizeText('21 Fujah, Surulere, Lagos NG',
                                              minFontSize: 12,
                                              maxLines: 1,
                                              maxFontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.w400
                                            ),),
                                          ),
                                          SizedBox(width: 3,),
                                          Icon(Icons.keyboard_arrow_down_sharp, color: Colors.green, size: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).highlightColor.withOpacity(.8)
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  ('Azeez Jide').split(' ').first.isEmpty ? 'U' : ('Azeez Jide').split(' ').first[0].toUpperCase(),
                                  // 'w',
                                  minFontSize: 13,
                                  maxFontSize: 18,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700,
                                      color:Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CappCustomFormField(
                            hintText: 'Search Items',
                            onChanged: (val) {},
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            keyboardType: TextInputType.text,
                            fillColor: theme.isDarkMode ? Colors.grey[800]: Colors.white,
                            radius: 20,
                            prefixIcon:  Icon(
                              Icons.search,
                              size: 20,
                              color: theme.isDarkMode ? Colors.white : Theme.of(context).highlightColor,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                borderRadius:  BorderRadius.circular(5),
                                onTap: (){
                          
                                },
                                child: Icon(
                                  Icons.sort_rounded,
                                  color: theme.isDarkMode ? Colors.white : Theme.of(context).highlightColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            isNotBorder: true,
                            controller: searchController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
