import 'package:bradesco_home/side_menu/presentation/viewmodels/sidemenu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/injector/get.dart';
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .1;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Drawer(
        width: width * 8,
        child: ListView.builder(
          itemCount: menus.length,
          itemBuilder: (context, index) {
            final menu = menus[index];
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
                      onTap: () => {Navigator.of(context).pop()},
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
                    onTap: () => {Navigator.of(context).pop()},
                  );
          },
        ),
      ),
    );
  }
}
