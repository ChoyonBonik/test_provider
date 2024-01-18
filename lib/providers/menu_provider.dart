// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
//
// import '../models/menus.dart';
//
// import 'package:http/http.dart' as http;
//
// class MenuProvider extends ChangeNotifier {
//
//   Menus? _menu;
//
//   Menus? get menu => _menu;
//
//   Future<void> fetchMenuData() async {
//
//     final response = await http.get('http://192.168.0.143:8080/main/menus');
//   }
//
//   // static const apiEndpoint =
//   //     'http://192.168.0.143:8080/main/menus';
//   //
//   // bool isLoading = true;
//   // String error = '';
//   // Menus menus = Menus(data: []);
//   // Menus serachedMenus = Menus(data: []);
//   // String searchText = '';
//   //
//   //
//   // getDataFromAPI() async {
//   //   print("Fetching data from API...");
//   //   try {
//   //     Response response = await http.get(Uri.parse(apiEndpoint));
//   //     if (response.statusCode == 200) {
//   //       menus = menuFromJson(response.body);
//   //       print("Data fetched successfully!");
//   //     } else {
//   //       error = response.statusCode.toString();
//   //       print("Error: $error");
//   //     }
//   //   } catch (e) {
//   //     error = e.toString();
//   //     print("Error: $error");
//   //   }
//   //   isLoading = false;
//   //   updateData();
//   // }
//   //
//   // updateData() {
//   //   serachedMenus.data.clear();
//   //   if (searchText.isEmpty) {
//   //     serachedMenus.data.addAll(menus.data);
//   //   } else {
//   //     serachedMenus.data.addAll(menus.data
//   //         .where((element) => element.header.toLowerCase().startsWith(searchText)).toList());
//   //   }
//   //   print("Updated data: ${serachedMenus.data}");
//   //   notifyListeners();
//   // }
//   //
//   // search(String header) {
//   //   searchText = header;
//   //   updateData();
//   // }
//
// }

// menu_provider.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/menus.dart';

class MenuProvider extends ChangeNotifier {
  Menus? _menu;

  Menus? get menu => _menu;

  Future<void> fetchMenuData(String apiEndpoint) async {
    try {
      final response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        _menu = menuFromJson(response.body);
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
