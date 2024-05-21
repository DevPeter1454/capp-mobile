

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class VersionTextWidget extends StatefulWidget {
  const VersionTextWidget({
    Key? key,
  }) : super(key: key);


  @override
  State<VersionTextWidget> createState() => _VersionTextWidgetState();
}

class _VersionTextWidgetState extends State<VersionTextWidget> {
  String version = '';

  @override
  void initState() {
    super.initState();
    getAppVersion();
  }

  getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        version = packageInfo.version;
      });
    } catch (e) {
      version = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'v $version',
        style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor.withOpacity(.7)),
      ),
    );
  }
}
