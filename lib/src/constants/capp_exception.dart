// ignore_for_file: public_member_api_docs, sort_constructors_first
class CappException implements Exception {
  final String errorMessage;
  CappException(this.errorMessage);


  @override
  String toString() => 'CappException(errorMessage: $errorMessage)';
}
