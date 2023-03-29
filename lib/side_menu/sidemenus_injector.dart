import 'package:bradesco_home/side_menu/data/repositories/sidemenu_repository_impl.dart';
import 'package:bradesco_home/side_menu/domain/repositories/sidemenu_repository_interface.dart';
import 'package:bradesco_home/side_menu/presentation/viewmodels/sidemenu_view_model.dart';

import '../core/injector/feature_injector.dart';
import '../core/injector/get.dart';
import 'domain/usecases/get_menu_usecase.dart';

class SideMenusInjector extends FeatureInjector {
  @override
  void injectAnalytics() {}

  @override
  void injectExceptionHandler() {}

  @override
  void injectRepositories() {
    get.registerFactory<SidemenuRepositoryInterface>(
        () => SidemenuRepositoryImpl(sidemenuDatasourceInterface: get()));
  }

  @override
  void injectUseCases() {
    get.registerFactory<GetMenuUseCaseInterface>(
        () => GetMenuUseCase(sidemenuRepository: get()));
  }

  @override
  void injectViewModels() {
    get.registerFactory<SideMenuViewModel>(
        () => SideMenuViewModel(getMenuUseCaseInterface: get()));
  }
}
