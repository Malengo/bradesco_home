import 'package:flutter/foundation.dart';

import '../entities/footer_item.dart';

class FavoriteFooter extends ChangeNotifier {
  List<FooterItem> items = [];

  void add(FooterItem item) {
    items.add(item);
    notifyListeners();
  }

  void remove(FooterItem item) {
    items.removeWhere((element) => element.title == item.title);
    notifyListeners();
  }
}
