import '../models/sidemenu_model.dart';

abstract class SidemenuDatasourceInterface {
  Future<List<SidemenuModel>> getMenu();
}
