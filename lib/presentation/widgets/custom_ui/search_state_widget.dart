//
// import 'dart:async';
//
// import 'package:CurrentPrice/core/model/available_region_data_resp.dart';
// import 'package:CurrentPrice/core/provider/auth_provider.dart';
// import 'package:CurrentPrice/utils/constants/Constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import 'cp_form_field.dart';
// import 'debouncer.dart';
//
//
// class SearchableStateWidget extends StatefulWidget {
//
//   const SearchableStateWidget({Key? key, }) : super(key: key);
//   @override
//   SearchableStateWidgetState createState() => new SearchableStateWidgetState();
// }
//
// class SearchableStateWidgetState extends State<SearchableStateWidget>  {
//
//   List<AvailableRegion> countriesList = [];
//   List<AvailableRegion> filteredCountriesList = [];
//   bool hasRun = false;
//   late AuthProvider authProvider;
//
//   TextEditingController textEditingController = TextEditingController();
//   final _debouncer = Debouncer(milliseconds: 400);
//
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       setState(() {
//         countriesList = authProvider.region!;
//         filteredCountriesList = countriesList;
//       });
//     });
//     super.initState();
//   }
//
//   processCountryList(){
//     try{
//       if(countriesList!=null){
//         countriesList = countriesList.toSet().toList();
//         if(!hasRun) {
//           hasRun = true;
//           filteredCountriesList = countriesList;
//         }
//       }else{
//         countriesList = [];
//         filteredCountriesList = [];
//       }
//
//       print('countryError ${filteredCountriesList.length}');
//       print('countryError ${countriesList.length}');
//     }catch(e){
//       countriesList = [];
//       filteredCountriesList = [];
//       print('countryError $e');
//     }
//   }
//
//
//   searchList(String val){
//     setState(() {
//       if(val.isNotEmpty){
//         print('country $val');
//         filteredCountriesList = countriesList.where((element) => element.name!.toLowerCase().contains(val.toLowerCase())).toList();
//       }else {
//         filteredCountriesList = countriesList.toList();
//       }
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     authProvider = Provider.of<AuthProvider>(context);
//     // processCountryList();
//     return  Scaffold(
//       backgroundColor: Colors.black.withOpacity(.4),
//       body: Stack(
//         children: [
//           Positioned(
//               bottom: 0,
//               child: Container(
//                 width: size.width,
//                 height: size.height * .65,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).scaffoldBackgroundColor,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20,),
//                     Container(
//                       width: size.width,
//                       child:
//                       Stack(
//                         children: [
//                           Center(
//                             child:
//                             Text('Select State',
//                               style: GoogleFonts.inter(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             right: 15,
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Icon(
//                                 Icons.close,
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Divider(height: 1, thickness: 0.7,),
//                     SizedBox(height: 10,),
//
//
//                     Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 10),
//                       child: CpCustomFormField(
//                         hintText: 'Search',
//                         // onSavedValue: (value) => email = value,
//                         keyboardType: TextInputType.text,
//                         validator: (value) =>
//                         value!.isNotEmpty
//                             ? null
//                             : 'Please enter valid fields',
//                         controller: textEditingController,
//                         hasAutoValidate: false,
//                         onChanged: (val) {
//                           _debouncer.run(() {
//                             searchList(val);
//                           });
//                         },
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             textEditingController.text.isNotEmpty ? Icons.close : Icons.search,
//                             color: textEditingController.text.isNotEmpty ? Theme.of(context).primaryColor :  Colors.green,
//                           ),
//                           onPressed: () {
//                             if(textEditingController.text.isNotEmpty) {
//                               setState(() {
//                                 textEditingController.text = '';
//                               });
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Container(
//                           child: filteredCountriesList.isNotEmpty ? Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: filteredCountriesList.asMap().entries.map((e) {
//
//                                 String item = e.value.name!;
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     InkWell(
//                                       onTap: (){
//                                         Navigator.of(context).pop(e.value);
//                                       },
//                                       child: Padding(
//                                         padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                                         child:
//                                         Text(
//                                           '${toBeginningOfSentenceCase(item)}' ,
//                                           style:  TextStyle( fontSize: 17),
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                         ),
//                                       ),
//                                     ),
//                                     Divider(
//                                       color: Colors.black.withOpacity(.5),
//                                       thickness: 0.3,
//                                     )
//                                   ],
//                                 );
//                               }).toList()
//
//                           ) :
//                           Container(
//                             width: size.width ,
//                             height: size.height * .3,
//                             child: Center(
//                               child: Text(
//                                 'No state found',
//                                 style: GoogleFonts.inter(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
