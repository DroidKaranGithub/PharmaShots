import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pharmashots/Constants/Constant.dart';


class ApiRepository {
  Future<http.Response> RegisterOTPVerification(Object modal) async {
    print("inside verification $modal");
    String Url = BASE_URL + "verification";
    print("REQUEST---> $Url");
    var body = await http.post(Uri.parse(Url), body: modal);
    print("Response--> ${body.body}");
    return body;
  }
  //https://viragtea.com/localsmart/public/api/shop/store

  //   Future<http.Response> createShop(Object modal) async {
  //   String Url = BASE_URL + "shop/store";
  //   var body = await http.post(Uri.parse(Url), body: modal);
  //   return body;
  // }

  Future<http.Response> LoginOTPVerification(Object modal) async {
    String Url = BASE_URL + "verification";
    var body = await http.post(Uri.parse(Url), body: modal);
    return body;
  }

  Future<http.Response> Register(Map<String, dynamic> modal) async {
    print(modal);
    String Url = BASE_URL + "register";

    print(Url);
    var body = await http.post(Uri.parse(Url), body: modal);
    print("API_REQUEST-->${body.body}");
    return body;
  }

  Future<http.Response> Login(Object modal) async {
    print("login $modal");
    String Url = BASE_URL + "login";
    print("API_REQUEST-->$Url");
    var body = await http.post(Uri.parse(Url), body: modal);
    print("API_REQUEST-->${body.body}");
    return body;
  }

  Future<http.Response> RecordingUploader(Object modal) async {
    String Url = BASE_URL + "query/store";
    var body = await http.post(Uri.parse(Url), body: modal);
    return body;
  }

  Future<http.Response> AskFormUpload(Object modal) async {
    String Url = BASE_URL + "query/update/3";
    var body = await http.post(Uri.parse(Url), body: modal);
    return body;
  }

  Future<http.Response> GetInquries(shopId) async {
    //https://viragtea.com/localsmart/public/api/shop/query/list?shop_id=1
    String Url = BASE_URL + "get-shop-notify-queries/$shopId";
    var body = await http.get(
      Uri.parse(Url),
    );
    return body;
  }

  Future<http.Response> GetResponse() async {
    String Url = BASE_URL + "shop/query/details/1";
    var body = await http.get(
      Uri.parse(Url),
    );
    return body;
  }

  Future<http.Response> GetShopDetail(int userId) async {
    String Url = BASE_URL + "shops?user_id=$userId";
    var body = await http.get(
      Uri.parse(Url),
    );
    return body;
  }

  Future<http.Response> GetCategory() async {
    String Url = BASE_URL + "get-categories-list";
    var body = await http.get(
      Uri.parse(Url),
    );
    return body;
  }

  Future<http.Response> checkWalletAmount(quiryId, String userID) async {
    String Url = BASE_URL + "check-vendor-wallet-amount";
    var body = await http.post(Uri.parse(Url),
        body: {"user_id": "$userID", "query_id": "$quiryId"});
    return body;
  }

  Future<http.Response> ResendOtp(modal) async {
    String Url = BASE_URL + "resend";
    var body = await http.post(Uri.parse(Url), body: modal);
    return body;
  }
}
