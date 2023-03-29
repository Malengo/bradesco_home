import 'package:bradesco_home/side_menu/data/models/sidemenu_model.dart';

import '../../domain/entities/menu.dart';

class SidemenuMapper {
  static Menu toEntity(SidemenuModel sidemenu) {
    return Menu(
        key: sidemenu.key,
        image: sidemenu.image,
        imageUrl: sidemenu.imageUrl,
        campaignID: sidemenu.campaignID,
        title: sidemenu.title,
        enable: sidemenu.enable,
        URL: sidemenu.URL);
  }
}
