import '../entities/menu.dart';

abstract class SidemenuRepositoryInterface {
  Future<List<Menu>> getMenus();
}
