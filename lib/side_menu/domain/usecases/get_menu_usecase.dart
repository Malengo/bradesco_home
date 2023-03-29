import 'package:bradesco_home/side_menu/domain/entities/menu.dart';

import '../repositories/sidemenu_repository_interface.dart';

abstract class GetMenuUseCaseInterface {
  Future<List<Menu>> call();
}

class GetMenuUseCase implements GetMenuUseCaseInterface {
  final SidemenuRepositoryInterface sidemenuRepository;

  GetMenuUseCase({required this.sidemenuRepository});

  @override
  Future<List<Menu>> call() async {
    return await sidemenuRepository.getMenus();
  }
}
