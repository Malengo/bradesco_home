import 'package:bradesco_home/home/domain/provider/favorite_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'footer_items.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteFooter>(
      builder: (context, value, child) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: constraints.maxWidth / 3,
                  height: 100,
                  child: value.items.length == 1
                      ? FooterItems(
                          imageName:
                              'assets/images/${value.items[0].image}.svg',
                          title: value.items[0].title)
                      : FooterItems(
                          imageName: 'assets/images/menu_easy_phone.svg',
                          title: 'EasyPhone'),
                ),
                Container(
                  width: constraints.maxWidth / 3,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  child: value.items.length == 2
                      ? FooterItems(
                          imageName:
                              'assets/images/${value.items[1].image}.svg',
                          title: value.items[1].title)
                      : FooterItems(
                          imageName: 'assets/images/menu_pix.svg',
                          title: 'Pix'),
                ),
                SizedBox(
                  width: constraints.maxWidth / 3,
                  height: 100,
                  child: value.items.length == 3
                      ? FooterItems(
                          imageName:
                              'assets/images/${value.items[2].image}.svg',
                          title: value.items[2].title)
                      : FooterItems(
                          imageName: 'assets/images/menu_security_key.svg',
                          title: 'Chave de Segurança'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
