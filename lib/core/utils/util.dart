
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;

abstract class Util {

  static Future<String> loadAsset(String filename) async {
    return await rootBundle.loadString('assets/$filename');
  }

  static Image imageFromBase64String(String base64String, BuildContext context) {
    try{
    return Image.memory(base64Decode(base64String), colorBlendMode: BlendMode.color, color: Theme.of(context).primaryColor,);
        }catch(e){
      return Image.asset('assets/images/v2Imgs/scanart.png',);
    }
  }

  static String formatMoney(String amount) {
    try{
      amount = (double.parse(amount ?? '0')).toString();
      return CurrencyTextInputFormatter.currency(locale: 'en-NG', decimalDigits: 2, symbol: '₦ ')
          .formatString(amount);
    }catch(e){
      return amount;
    }
  }

  // static Map<String, List<NotificationDummy>> categorizeObjects(List<NotificationDummy> notifications) {
  //   final today = DateTime.now();
  //   final yesterday = today.subtract(Duration(days: 1));
  //   final lastWeek = today.subtract(Duration(days: 7));
  //
  //   List<NotificationDummy> todayList = [];
  //   List<NotificationDummy> yesterdayList = [];
  //   List<NotificationDummy> lastWeekList = [];
  //   List<NotificationDummy> olderList = [];
  //
  //   for (var notification in notifications) {
  //     if (notification.dateTime.year == today.year && notification.dateTime.month == today.month && notification.dateTime.day == today.day) {
  //       todayList.add(notification);
  //     } else if (notification.dateTime.year == yesterday.year && notification.dateTime.month == yesterday.month && notification.dateTime.day == yesterday.day) {
  //       yesterdayList.add(notification);
  //     } else if (notification.dateTime.isAfter(lastWeek) && notification.dateTime.isBefore(yesterday)) {
  //       lastWeekList.add(notification);
  //     } else {
  //       olderList.add(notification);
  //     }
  //   }
  //
  //   return {
  //     'Today': todayList,
  //     'Yesterday': yesterdayList,
  //     'Last Week': lastWeekList,
  //     'Older': olderList,
  //   };
  // }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  static String currentDateTime() {
    return new DateTime.now().toString();
  }

  static String convertDateFromServerToUI(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [dd, ', ', M, ' ', yyyy, '\n', hh, ':', nn, ' ', am]);
    // hh:mm a
  }

  static String convertDateFromServerToUITime(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [hh, ':', nn, ' ', am]);
    // hh:mm a
  }

  static String convertDateFromServerToUI3(DateTime strDate) {
    try {
      return formatDate(
          convertToLocale(strDate), [ yyyy, '-', mm, '-', dd]);
    }catch(e){
      print(e);
      return '';
    }
    // hh:mm a
  }


  static String convertDateFromServerToUI01(DateTime strDate) {
    try {
      return formatDate(
          convertToLocale(strDate), [ dd, '/', mm, '/', yyyy]);
    }catch(e){
      print(e);
      return '';
    }
    // hh:mm a
  }

  static String convertDateFromServerToUI4(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [ D, ', ', dd, ' ', M, ' ',yyyy, ', ', hh, ':', nn]);
    // hh:mm a
  }
  // 'Tue, 28 Jun 2020, 18:49',

  static String convertDateToTimeStamp(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [ yyyy, '-',MM, '-', dd, ' ', HH, ':', mm ,':', ss]);
    // hh:mm a
  }


  //Format------05. Sept. 2018
  static String convertDateFromServerToUI5(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [ dd, '. ', M, '. ',yyyy]);
    // hh:mm a
  }


  //Format------January 05, 2018
  static String convertDateFromServerToUI6(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [  MM,' ', dd,  ', ',yyyy]);
    // hh:mm a
  }

  static String getDateTimePlusDuration(DateTime strDate, TimeOfDay time, Duration addPeriod) {
    try{
        final dateTime = DateTime(strDate.year, strDate.month, strDate.day,
            time.hour, time.minute).add(addPeriod);
      return formatDate(
          convertToLocale(dateTime), [ hh, ':', nn, ' ', am]);
    }catch(e){

      return formatDate(
          convertToLocale(strDate), [ hh, ':', nn, ' ', am]);
    }

  }

  static String convertDateFromServerToUI2(DateTime strDate) {
    return formatDate(convertToLocale(strDate), [dd, '-', mm, '-', yyyy]);
  }

  static String convertDateFromUIToServer(DateTime strDate) {
    return formatDate(convertToLocale(strDate), [yyyy, '-', mm, '-', dd]);
  }

  static bool checkIfTimeNotExpired(DateTime createdAt, DateTime dueAt) {
    try {
      final currentTime = DateTime.now();

      return currentTime.isAfter(createdAt) && currentTime.isBefore(dueAt);
    }catch(e){
      print(' $e');
      return false;
    }
  }

  static int getTimeLeft( DateTime dueAt) {
    try {
      final currentTime = DateTime.now();
      return dueAt
          .difference(currentTime)
          .inSeconds;
    }catch(e){
      return 0;
    }
  }
  static int getDaysLeft( DateTime dueAt) {
    try {
      final currentTime = DateTime.now();
      return dueAt
          .difference(currentTime)
          .inDays;
    }catch(e){
      return 0;
    }
  }

  static List<String> getImagesBase64(List<File> files){
    try{
      return files.map((file) {
        List<int> fileBytes = file.readAsBytesSync();
        String base64String = base64Encode(fileBytes);
        return base64String;
      }).toList();
    }catch(e){
      return [];
    }
  }

  static String convertDateTimeFromServerToUI(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [dd, ', ', M, ' ', yyyy, ' \n', h, ':', n, ' ', am]);
  }


  static String convertToDateFromServerData(DateTime strDate) {
    return formatDate(
        convertToLocale(strDate), [ hh, ':', nn, ' ', am]);
  }

  static String getInitials(String userFullname) {
   try{
     List<String> names = userFullname.split(" ");
     names.removeWhere((e) => e=="");
     String initials = "";
     int numWords = 2;

     if(names.length.toString() !="1") {
       if (numWords < names.length) {
         numWords = names.length;
       }
       for (var i = 0; i < numWords; i++) {
         initials += '${names[i][0]}';
       }

     }else{
       List<String> firstName = names[0].split("");
       initials = firstName.length>1 ? firstName[0]+firstName[1] : firstName[0];
     }
     return initials.toUpperCase();
   }catch(e){
     return userFullname.split('').first;
   }
  }


  // convert it to local
  static DateTime convertToLocale(DateTime date){
   return date.toLocal();
  }

}




extension TruncateDoubles on double {
  double truncateToDecimalPlaces(int fractionalDigits) => (this * pow(10,
      fractionalDigits)).truncate() / pow(10, fractionalDigits);
}
