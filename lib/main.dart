import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cadastro.dart';
import 'rotas.dart'; // Importe seu arquivo de rotas
import 'package:flutter_application_1/pages/consultaclientes.dart'; // Importe a tela de consulta de clientes
import 'package:flutter_application_1/pages/sobre.dart'; // Importe a tela "Sobre"

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes, // Configura as rotas
      home: MyHomePage(), // Página inicial da aplicação
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Índice da tela selecionada no BottomNavigationBar

  // Lista de widgets para cada item do BottomNavigationBar
  static List<Widget> _widgetOptions = <Widget>[
    CadastroPage(), // Página de cadastro de clientes
    ConsultaClientesPage(), // Página de consulta de clientes
    SobrePage(), // Página "Sobre"
  ];

  // Método para atualizar o índice da tela selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Consultar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
