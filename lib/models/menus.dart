// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Menus menuFromJson(String str) => Menus.fromJson(json.decode(str));

String menuToJson(Menus data) => json.encode(data.toJson());

class Menus {
  final List<Datum> data;

  Menus({
    required this.data,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int menuId;
  final String header;
  final bool child;
  final String logo;
  final List<SubMenu> subMenu;

  Datum({
    required this.menuId,
    required this.header,
    required this.child,
    required this.logo,
    required this.subMenu,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    menuId: json["menuId"],
    header: json["header"],
    child: json["child"],
    logo: json["logo"],
    subMenu: List<SubMenu>.from(json["subMenu"].map((x) => SubMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menuId": menuId,
    "header": header,
    "child": child,
    "logo": logo,
    "subMenu": List<dynamic>.from(subMenu.map((x) => x.toJson())),
  };
}

class SubMenu {
  final int subMenuId;
  final String header;
  final String logo;
  final int menuId;
  final String path;

  SubMenu({
    required this.subMenuId,
    required this.header,
    required this.logo,
    required this.menuId,
    required this.path,
  });

  factory SubMenu.fromJson(Map<String, dynamic> json) => SubMenu(
    subMenuId: json["subMenuId"],
    header: json["header"],
    logo: json["logo"],
    menuId: json["menuId"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "subMenuId": subMenuId,
    "header": header,
    "logo": logo,
    "menuId": menuId,
    "path": path,
  };
}
