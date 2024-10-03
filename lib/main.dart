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
    _pageController
      ..animateToPage(index,
          duration: Duration(milliseconds: 700),
          curve: Curves.ease);
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
        drawer: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.green, width: 5)
            ),
            width: 300,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green,
                  width: 250, height: 80,
                ),
                SizedBox(height: 16,),
                Container(
                  color: Colors.green,
                  width: 250, height: 80,
                ),
                SizedBox(height: 16,),
                Container(
                  color: Colors.green,
                  width: 250, height: 80,
                ),
                SizedBox(height: 16,),
                Container(
                  color: Colors.green,
                  width: 250, height: 80,
                ),
                SizedBox(height: 16,),
                Container(
                  color: Colors.green,
                  width: 250, height: 80,
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.black87,
            ),
            Container(
              color: Colors.blueAccent,
            ),
            Container(
              color: Colors.green,
            ),
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
