import 'package:flutter/foundation.dart';

import '../entities/footer_item.dart';

class FavoriteFooter extends ChangeNotifier {
  List<FooterItem> items = [];

  void add(String imageName, String title) {
    items.add(FooterItem(title, imageName));
    notifyListeners();
  }

  void remove(String imageName, String title) {
    items?.remove(FooterItem(imageName, title));
    notifyListeners();
  }
}
