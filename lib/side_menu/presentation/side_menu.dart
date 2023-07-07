import 'dart:math';

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
  List<FooterItem> items = [];

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
                              ? SvgPicture.asset(
                                  'assets/images/${menu.image}.svg',
                                  width: 35,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : null,
                          trailing: index == 1
                              ? isFavorite
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.black,
                                      size: 20,
                                      weight: 20,
                                    )
                              : null,
                          onTap: () => {
                            setState(() {
                              isFavorite
                                  ? value.remove(item)
                                  : value.items.length >= 3
                                      ? null
                                      : value.add(item);
                            }),
                          },
                        ),
                      ])
                    : ListTile(
                        title: Text(
                          menu.title,
                          style: const TextStyle(fontSize: 15),
                        ),
                        horizontalTitleGap: 10,
                        leading: SvgPicture.asset(
                          'assets/images/${menu.image}.svg',
                          width: 35,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        trailing: index != 0 || menu.title == "ATENDIMENTO"
                            ? isFavorite
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.star_border,
                                    color: Colors.black,
                                    size: 20,
                                    weight: 20,
                                  )
                            : null,
                        onTap: () => {
                          setState(() {
                            isFavorite
                                ? value.remove(item)
                                : value.items.length >= 3
                                    ? null
                                    : value.add(item);
                          }),
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
