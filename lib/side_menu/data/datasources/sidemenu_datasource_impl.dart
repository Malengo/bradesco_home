import 'dart:convert';

import 'package:bradesco_home/side_menu/data/datasources/sidemenu_datasource_interface.dart';
import 'package:bradesco_home/side_menu/data/models/sidemenu_model.dart';
import 'package:flutter/services.dart';

class SidemenuDatasourceImpl implements SidemenuDatasourceInterface {
  @override
  Future<List<SidemenuModel>> getMenu() async {
    String json = await _loadJson();
    final response = jsonDecode(json);

    final result = response["results"] as List;
    final listMenu = result.map((e) => SidemenuModel.fromJson(e)).toList();
    return listMenu;
  }

  Future<String> _loadJson() async {
    return rootBundle.loadString('assets/menu_items.json');
  }
}
