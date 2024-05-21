import 'dart:async';

abstract class DialogHandler {

  /// Register global progress indicators
  void registerGlobalProgressIndicatorDialog(
    Function() globalProgressIndicator,
  );

  /// Show global progress indicators
  void showGlobalProgressIndicator();

  /// Register a callback to exist any opened dialog
  void registerDismissDialog(Function(bool isDialogVisible) dismissDialog);

  /// Dismiss Dialog
  void dismissDialog();

  /// To get the status of a dialog
  bool isDialogVisible();
}

class DialogHandlerImpl implements DialogHandler {
  bool _isDialogVisible = false;

  late Function() _globalProgressIndicator;
  late Function(bool isDialogVisible) _dismissDialog;



  @override
  void registerDismissDialog(
      Function(
        bool isDialogVisible,
      ) dismissDialog) {
    _dismissDialog = dismissDialog;
  }

  @override
  void dismissDialog() {
    _isDialogVisible = false;
    _dismissDialog(true);
  }

  @override
  bool isDialogVisible() {
    return _isDialogVisible;
  }

  @override
  void registerGlobalProgressIndicatorDialog(
      Function() globalProgressIndicator) {
    _globalProgressIndicator = globalProgressIndicator;
  }

  @override
  void showGlobalProgressIndicator() {
    _globalProgressIndicator();
  }
}
