class Api {
  static const baseUrl =
      "http://portal.transvisionshipping.com:9999/tsvapi/SqlInterface.svc/";

  static String loginApi(dynamic userName, dynamic passWord) {
    String loginEndPoint = "emplogin?username=$userName&password=$passWord";
    return loginEndPoint;
  }

  static String forgotApi(dynamic userName) {
    String forgotEndPoint = "emp_forgotpassord?username=$userName";
    return forgotEndPoint;
  }

  static String securityCodeApi(dynamic userName) {
    String securityCode = 'emp_securitycode?username=$userName';
    return securityCode;
  }

  static String userProfileApi(dynamic userName) {
    String userProfile = 'empprofile?empid=$userName';
    return userProfile;
  }
}
