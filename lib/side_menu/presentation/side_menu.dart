import 'dart:math';

import 'package:bradesco_home/side_menu/presentation/components/leading_image_component.dart';
import 'package:bradesco_home/side_menu/presentation/components/star_favorite_component.dart';
import 'package:bradesco_home/side_menu/presentation/viewmodels/sidemenu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/injector/get.dart';
import '../../home/domain/entities/footer_item.dart';
import '../../home/domain/provider/favorite_footer.dart';
import '../domain/entities/menu.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final SideMenuViewModel _menuViewModel = get();
  List<Menu> menus = [];

  @override
  void initState() {
    super.initState();
    _getMenu();
  }

  void _getMenu() async {
    final menu = await _menuViewModel.fecth();
    setState(() {
      menu.forEach((element) {
        if (element.enable) {
          menus.add(element);
        }
      });
    });
  }

  void _setFavorite(bool isFavotite, FooterItem item) {
    setState(() {
      isFavotite
          ? Provider.of<FavoriteFooter>(context, listen: false).remove(item)
          : Provider.of<FavoriteFooter>(context, listen: false).add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .1;

    return Consumer<FavoriteFooter>(
      builder: (context, value, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Drawer(
            width: width * 8,
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                FooterItem item = FooterItem(
                  menu.title,
                  menu.image,
                );

                bool isFavorite =
                    value.items.any((element) => element.title == menu.title);

                return index == 1 || menu.title == "ATENDIMENTO"
                    ? Column(children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Divider(
                            height: 2,
                            color: Colors.blueGrey,
                          ),
                        ),
                        ListTile(
                          title: index == 1
                              ? Text(
                                  menu.title,
                                  style: const TextStyle(fontSize: 15),
                                )
                              : Text(
                                  menu.title,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                          horizontalTitleGap: 10,
                          leading: index == 1
                              ? LeadingImage(image: menu.image)
                              : null,
                          trailing: index == 1
                              ? StarFavorite(isFavorite: isFavorite)
                              : null,
                          onTap: () => {_setFavorite(isFavorite, item)},
                        ),
                      ])
                    : ListTile(
                        title: Text(
                          menu.title,
                          style: const TextStyle(fontSize: 15),
                        ),
                        horizontalTitleGap: 10,
                        leading: LeadingImage(image: menu.image),
                        trailing: index != 0 || menu.title == "ATENDIMENTO"
                            ? StarFavorite(isFavorite: isFavorite)
                            : null,
                        onTap: () => {
                          index == 0
                              ? Navigator.of(context).pop()
                              : _setFavorite(isFavorite, item)
                        },
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
