import 'package:flutter/material.dart';
import 'package:meus_testes_telas/setting_screen.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tarefaController = TextEditingController();
  PageController _pageController = PageController();
  int _selectIndex = 0;
  void _itemSelect(int index){
    setState(() {
      _selectIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Lista de tarefas"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              accountName: Text("Danilo Cruz"),
              accountEmail: Text("danilo.souza@bus2.me"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black54,
              ),
            ),
            ListTile(
              title: const Text("Analise seu histórico"),
              trailing: const Icon(Icons.equalizer),
            ),
            const ListTile(
              title: Text("Histórico de compras"),
              trailing: Icon(Icons.card_travel),
            ),
            const ListTile(
              title: Text("Configurações"),
              trailing: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: PageView(
        controller:  _pageController,
        onPageChanged: (index){
          setState(() {
            _selectIndex = index;
          });
        },
        children: [
          Center(child: Text("Gráfico"),),
          Center(child: Text("Compras"),),
          Center(child: Text("Configurações"),)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white30,
        currentIndex: _selectIndex,
          onTap: _onItemTapped,
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.equalizer), label: "Gráfico"),
        BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Compras"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Configurações"),
      ]),
    );
  }
}
