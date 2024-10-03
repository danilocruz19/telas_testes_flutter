import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _itemSelecionado(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int newIndex = _pageController.page!.round();
      if (_selectedIndex != newIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Tela inicial",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1),
                  color: Colors.white12,
                ),
                accountName: Text("Danilo"),
                accountEmail: Text("danilo@gmail.com"),
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")),
              ),
              Builder(  // Adicionado o Builder aqui
                builder: (context) {
                  return ListTile(
                    title: Text("Item 1"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      _itemSelecionado(0);
                      Navigator.of(context).pop();  // Fecha o Drawer
                    },
                  );
                },
              ),
              Builder(  // Adicionado o Builder aqui
                builder: (context) {
                  return ListTile(
                    title: Text("Item 2"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      _itemSelecionado(1);
                      Navigator.of(context).pop();  // Fecha o Drawer
                    },
                  );
                },
              ),
              Builder(  // Adicionado o Builder aqui
                builder: (context) {
                  return ListTile(
                    title: Text("Item 3"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      _itemSelecionado(2);
                      Navigator.of(context).pop();  // Fecha o Drawer
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(color: Colors.black87),
            Container(color: Colors.blueAccent),
            Container(color: Colors.green),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          currentIndex: _selectedIndex,
          onTap: _itemSelecionado,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), label: "Adicionar Foto"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Configurações"),
          ],
        ),
      ),
    );
  }
}
