import 'package:bradesco_home/home/domain/entities/footer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/provider/favorite_footer.dart';
import 'components/footer.dart';
import 'components/footer_items.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<FavoriteFooter>(
      builder: (context, value, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(243, 28, 92, 1),
                  Color.fromRGBO(222, 25, 66, 1),
                  Color.fromRGBO(185, 27, 115, 1)
                ]),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/bradescoLogo.png'),
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Image(
                    alignment: Alignment.topLeft,
                    image: AssetImage('assets/images/classic.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Text(
                          "José Augusto,",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      fixedSize:
                          width <= 320 ? const Size(0, 45) : const Size(0, 65),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'acessar conta',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Footer();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
