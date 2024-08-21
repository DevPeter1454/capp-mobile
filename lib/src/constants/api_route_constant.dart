
class ApiConstant {
  //------------  BASE_Url  ------------------------------//
  static const String baseUrl = 'https://capp-api-7d8a6573f031.herokuapp.com/';

  //------------  Auth  ------------------------------//
  static const String register = 'api/v1/user/auth/register';
  static const String login = '${baseUrl}api/v1/user/auth/signin';
  static const String verifyOtp = 'auth/verify-otp';
  static const String passwordReset = 'password/reset';
  static const String logout = 'auth/logout';
  static const String updateInfo = "api/v1/user/auth/update_user";

  //------------  Know your leader  ------------------------------//
  static const String getLeadersList = "${baseUrl}api/v1/user/leader/list";

  static const String getALeader = "${baseUrl}api/v1/user/leader";

  //------------  Civic Education  ------------------------------//
  static const String getCivicEducationList =
      "${baseUrl}api/v1/user/education/list";

  static const String getPolicyList = "${baseUrl}api/v1/user/policy";
  static const String getPolicyCollections =
      "${baseUrl}api/v1/user/collections";
  static const String createPolicyCollection =
      "${baseUrl}api/v1/user/collection/create";
  static const String updatePolicyCollection =
      "${baseUrl}api/v1/user/collections";

  static const String getPoliticalParties = "${baseUrl}api/v1/user/parties";
  static const String joinAPoliticalParty = "${baseUrl}api/v1/user/parties";

  static const String getMdas = "${baseUrl}api/v1/user/mda/list";
  static const String getMdaById = "${baseUrl}api/v1/user/mda";
  static const String lodgeAComplaint = "${baseUrl}api/v1/user/mda/complain";

  static const String getQuizList = "${baseUrl}api/v1/user/quiz/list";
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

class UserConstant {
  static String firstName = "";
  static String lastName = "";
}
