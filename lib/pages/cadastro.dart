import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cliente.dart';
import 'package:flutter_application_1/pages/camera.dart'; // Importe a classe Cliente

class CadastroPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  void _salvarCliente() {
    try {
      setState(() {
        String nome = nomeController.text;
        int idade = int.parse(idadeController.text);
        String cidade = cidadeController.text;
        String telefone = telefoneController.text;

        Cliente cliente = Cliente(
            nome: nome, idade: idade, cidade: cidade, telefone: telefone);
        Cliente.listaDeClientes.add(cliente);

        nomeController.clear();
        idadeController.clear();
        cidadeController.clear();
        telefoneController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dados Salvos Corretamente'),
            backgroundColor: Colors.green,
          ),
        );
      });
    } catch (e) {
      // Exibe uma mensagem de erro se alguma coisa der errado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _limparCampos() {
    setState(() {
      nomeController.clear();
      idadeController.clear();
      cidadeController.clear();
      telefoneController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 64,
                      ),
                      Text('Abrir Câmera'),
                    ],
                  ),
                ),
              ),
            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: cidadeController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _salvarCliente,
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: _limparCampos,
                  child: Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
