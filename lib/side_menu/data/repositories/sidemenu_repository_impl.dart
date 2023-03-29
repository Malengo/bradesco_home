import 'package:bradesco_home/side_menu/data/datasources/sidemenu_datasource_interface.dart';
import 'package:bradesco_home/side_menu/data/mappers/sidemenu_mapper.dart';
import 'package:bradesco_home/side_menu/domain/entities/menu.dart';

import '../../domain/repositories/sidemenu_repository_interface.dart';

class SidemenuRepositoryImpl implements SidemenuRepositoryInterface {
  final SidemenuDatasourceInterface sidemenuDatasourceInterface;

  SidemenuRepositoryImpl({required this.sidemenuDatasourceInterface});

  @override
  Future<List<Menu>> getMenus() async {
    final result = await sidemenuDatasourceInterface.getMenu();
    final resultEntity =
        result.map((data) => SidemenuMapper.toEntity(data)).toList();
    return resultEntity;
  }
}
