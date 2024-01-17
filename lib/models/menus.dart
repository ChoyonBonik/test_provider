import 'dart:convert';

List<Menu> menuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  final int menuId;
  final String header;
  final bool child;
  final String logo;
  final List<SubMenu> subMenu;

  Menu({
    required this.menuId,
    required this.header,
    required this.child,
    required this.logo,
    required this.subMenu,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
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
