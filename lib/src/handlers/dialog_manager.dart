import 'package:flutter/material.dart';
import 'package:capp/src/data_source/di/injection_container.dart';

import 'dialog_handler.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  const DialogManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  late DialogHandler _dialogHandler;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _dialogHandler = locator<DialogHandler>();
    _dialogHandler.registerGlobalProgressIndicatorDialog(showGlobalIndicator);
    _dialogHandler.registerDismissDialog(dismissDialog);
  }

  void showGlobalIndicator() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(.65),
        child:   SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: Theme.of(context).scaffoldBackgroundColor
                 ),
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                   margin: const EdgeInsets.symmetric(horizontal: 40),
                   width: MediaQuery.of(context).size.width,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CircularProgressIndicator(
                         color: Colors.black.withOpacity(.8),
                       ),
                       const SizedBox(width: 20,),
                        const Text( 'Processing request...',
                       style: TextStyle(
                         fontSize: 14
                       ),)
                     ],
                   )),
            ],
          ),
        ),
      ),
    );

    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  bool dismissDialog(isDialogVisible) {
    ///To dismiss bottomSheetDialog and modalDialog
    ///USE Navigator.of(context).pop()
    ///else
    ///Remove page from overlay
    if (isDialogVisible) {
      if (_overlayEntry != null) {
        _overlayEntry?.remove();
      }
    }

    return isDialogVisible;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if (_dialogHandler.isDialogVisible()) {
          if (_overlayEntry != null) {
            _overlayEntry?.remove();
          }
        }
        return Future.delayed(Duration.zero);
      },
        child: widget.child);
  }
}
