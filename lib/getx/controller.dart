import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// class RightController extends GetxController {
//   RightController(){
//     fetch();
//   }
//   RxBool isLoading = true.obs;
//   RxList listData = <dynamic>[].obs;
//   int? totalPages;
//   List<dynamic> list = [];
//
//   int page = 0;
//
//   void fetch({bool isFirstPage = false}) async {
//     if (isFirstPage) {
//       page = 0;
//     }
//     // final response = await
//     http
//         .get(Uri.parse(
//             "https://jsonplaceholder.typicode.com/posts?_limit=2&_page=$page"))
//         .then((value) {
//       List body = convert.jsonDecode(value.body);
//       if (isFirstPage) {
//         list = body;
//       } else {
//         list.addAll(body);
//       }
//       page++;
//
// if (kDebugMode) {
// print('...........................');
// print(list.toString());
// print(list.length.toString());
// print('...........................');
// }
//       update();
//     });
//
//   }
// }
class RightController extends GetxController {
  RightController() {
    fetch();
  }

  RxBool isLoading = true.obs;
  RxList listData = <dynamic>[].obs;
  int? totalPages;
  List<dynamic> list = [];

  int page = 0;

  void fetch({bool isFirstPage = false}) async {
    if (isFirstPage) {
      page = 0;
    }
    final response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?_limit=2&_page=$page"));
    List body = convert.jsonDecode(response.body);
    if (isFirstPage) {
      list = body;
    } else {
      list.addAll(body);
    }
    page++;

    if (kDebugMode) {
      print('...........................');
      print(list.toString());
      print(list.length.toString());
      print('...........................');
    }

    update();
  }
}
