
class ApiConstant{


  //------------  BASE_Url  ------------------------------//
  static const String baseUrl = 'https://trovexx-laravel-production.up.railway.app/api/';

  //------------  Auth  ------------------------------//
  static const String register = 'auth/register';

  static const String login = 'auth/login';
  static const String verifyOtp = 'auth/verify-otp';
  static const String passwordReset = 'password/reset';
  static const String logout = 'auth/logout';


  //------------  Transaction Pin  ------------------------------//
  static const String transactionPin = 'transactionpin';
  static const String resetTransactionPin = 'pin/reset-transaction-pin';
  static const String verifyResetTransactionPin = 'pin/verify-otp';
  static const String setNewTransactionPin = 'pin/new-pin';
  static const String changeTransactionPin = 'pin/change-pin';
  static const String verifyChangeTransactionPin = 'pin/change-verify-otp';
  static const String newSetChangeTransactionPin = 'pin/set-pin-change';

  //------------  Products  ------------------------------//
  static const String addNewProduct = 'products/new-item';
  static const String getUsersProduct = 'myproducts/all';
  static const String getAllProduct = 'products/all';
  static const String deleteProduct = 'products/delete';
  static const String getCategories = 'categories';
  static const String getProductPlans = 'product-plans';


  //------------  Services  ------------------------------//
  static const String addNewService = 'services/new';
  static const String getUsersServices = 'services/my-services';
  static const String getAllService = 'services/all';
  static const String deleteService = 'services/delete';
  static const String getServiceTypes = 'services/types';
  static const String getServiceById = 'service-details/{service_id}';
  static const String getServicePlans = 'services/plans';



}