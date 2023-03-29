import '../../domain/entities/menu.dart';
import '../../domain/usecases/get_menu_usecase.dart';

class SideMenuViewModel {
  final GetMenuUseCaseInterface getMenuUseCaseInterface;

  SideMenuViewModel({required this.getMenuUseCaseInterface});

  Future<List<Menu>> fecth() async {
    return await getMenuUseCaseInterface.call();
  }
}
