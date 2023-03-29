import 'package:bradesco_home/core/injector/feature_injector.dart';
import 'package:bradesco_home/side_menu/data/datasources/sidemenu_datasource_impl.dart';
import 'package:bradesco_home/side_menu/data/datasources/sidemenu_datasource_interface.dart';

import 'core/injector/get.dart';
import 'side_menu/sidemenus_injector.dart';

abstract class EnvInjectors {
  List<FeatureInjector> featureInjectors = [SideMenusInjector()];

  Future<void> inject() async {
    featureInjectors.forEach((element) => element.inject());
    injectDataSources();
  }

  void injectDataSources();
}

class ReleaseInjector extends EnvInjectors {
  @override
  void injectDataSources() {
    get.registerFactory<SidemenuDatasourceInterface>(
        () => SidemenuDatasourceImpl());
  }
}
