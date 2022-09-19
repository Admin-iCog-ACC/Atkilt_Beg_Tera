const kLocalKey = {
  'userInfo': 'userInfo',
  'shippingAddress': 'shippingAddress',
  'wishlist': 'wishlist',
  'home': 'home',
  'cart': 'cart',
  'jwtToken': 'jwtToken'
};
String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pY2hhZWxAZ21haWwuY29tIiwidG9rZW5JZCI6ImIzMzU5ODZjLWYyNmUtNDhjZi04YWU2LThjZmRhMTI4NGUzOSIsImlhdCI6MTY0MTk4NzQ0NiwiZXhwIjoxNjQyMDczODQ2fQ.v3LeXaQChUGW_iSfchBqsIzDwE58VgNbf74qMWFPzzk';
Map<String, String>? authHeader = {
  'Authorization': 'Bearer $token',
  'Content-Type': 'application/json'
};

class ConstVals {
  // String baseURL = "http://127.0.0.1:3000";
  String baseURL = "http://46.101.106.109:3000";

  ConstVals();

  void setHeader(authHeader) {
    authHeader = authHeader;
  }

  Map<String, String> getHeader() {
    return authHeader!;
  }

  String getBaseURL() {
    return baseURL;
  }

  String getToken() {
    return token;
  }

  void setToken(String token) {
    token = token;
  }
}
