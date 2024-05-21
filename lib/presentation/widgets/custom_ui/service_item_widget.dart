
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';



class ServiceItemWidget extends StatefulWidget {
  const ServiceItemWidget({
    super.key,  this.onSelectServicePressed,
  });
  final Function()?  onSelectServicePressed;

  @override
  State<ServiceItemWidget> createState() => _ServiceItemWidgetState();
}

class _ServiceItemWidgetState extends State<ServiceItemWidget> {
  Map< String, int> selectedItems = {};


  void showEditPackageModal({required String title, required Function onSelected, required int index}) {
    CustomDialogWidgets.buildEditPackageDialog(
        context: context,
        onItemClicked: (val) {
          onSelected(val);
        },
        onButtonPressed: (){
        },
        selectedItems: selectedItems,
        onQuantityChanged: (val){
          setState(() {
            if(val.values.first!=0){
              selectedItems.putIfAbsent(val.keys.first, () => val.values.first);
            }else{
              selectedItems.remove(val.keys.first);
            }
          });
        },
        hideBottomBtn: true,
        itemSelected: index,
        size: MediaQuery.of(context).size,
        list: ['Bedrooms','Bathrooms', 'Kitchen', 'Living Room'],
        title: title);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.cleaning_services,
                            color: Colors.deepPurpleAccent, size: 15,),
                          SizedBox(width: 4,),
                          Text('Services',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),),

                        ],
                      ),
                    ),
                    const Text('Take Down Hairstyle',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 15,),
                          SizedBox(width: 4,),
                          Text('4.3 (12.3K Reviews)',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),

                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Stating at \$20.00',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 3),
                          child: Icon(
                            Icons.circle, color: themeProvider.isDarkMode ? AppColors.offWhite: Colors.black, size: 5,),
                        ),
                        const Text('1 hrs 30mins',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),),

                      ],
                    ),
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(14),

                    child: Image.asset('assets/images/clean2.jpeg', height: 100,
                      fit: BoxFit.fill,
                      width: 110,))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: DottedSeparator(
                height: 0.6,
                color: Colors.grey.withOpacity(.6),
              ),
            ),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OtherChoreWidget(title: 'Basic Service: ',
                  desc: 'Clothes ironing & Folding, Change of Bedsheets per rooms',),
                selectedItems.isNotEmpty ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedItems.entries.map((e) =>
                      OtherChoreWidget(title: 'Other Service: ',
                    desc: '${e.value} ${e.key}(s)',)
                  ).toList(),
                ):const SizedBox()
                // OtherChoreWidget(title: '2 Bedrooms & 2 Bathrooms: ',
                //   desc: '2 Bedrooms & 2 Bathrooms',),
                // OtherChoreWidget(title: 'Kitchen: ',
                //   desc: 'Kitchen',),
                // OtherChoreWidget(title: 'Living Room: ',
                //   desc: 'Living Room',),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CappCustomButton(
                    isActive: true,
                    onPress: () {
                      showEditPackageModal(title: 'Take Down Hairstyle',
                          onSelected: (val) {

                          },
                          index: 0
                      );
                    },
                    color: Colors.transparent,
                    hasBorder: true,
                    width: size.width * .4,
                    borderRadius: 8,
                    paddingVertical: 8,
                    borderColor: Theme
                        .of(context)
                        .primaryColor,
                    isSolidColor: true,
                    child: Text(
                      'Edit your package',
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  CappCustomButton(
                    isActive: true,
                    onPress: widget.onSelectServicePressed,
                    width: size.width * .4,
                    borderRadius: 8,
                    paddingVertical: 10,
                    color: Theme
                        .of(context)
                        .highlightColor,
                    isSolidColor: true,
                    child: const Text(
                      'Select Service',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: Colors.grey,
                height: .5,
              ),
            ),
          ],
        ),
      );
    });
  }
}