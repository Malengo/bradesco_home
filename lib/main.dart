import 'package:bradesco_home/home/presentation/footer_items.dart';
import 'package:bradesco_home/injectors.dart';
import 'package:bradesco_home/side_menu/presentation/side_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _configApp();
  }

  Future<void> _configApp() async {
    await ReleaseInjector().inject();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(243, 28, 92, 1),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
              iconSize: 25,
            ),
          ],
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Row(
                  children: const [
                    Text(
                      "Teste",
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
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth / 3,
                        height: 100,
                        child: FooterItems(
                            imageName: 'assets/images/chaveDeSegurancA.png',
                            title: 'Chave de Segurança'),
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
                        child: FooterItems(
                            imageName: 'assets/images/perguntePraBia.png',
                            title: 'Bia'),
                      ),
                      SizedBox(
                        width: constraints.maxWidth / 3,
                        height: 100,
                        child: FooterItems(
                            imageName: 'assets/images/icoPixHome.png',
                            title: 'Pix'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
