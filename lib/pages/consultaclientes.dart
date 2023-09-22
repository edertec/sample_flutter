import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cliente.dart';

class ConsultaClientesPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ConsultaClientesPageState createState() => _ConsultaClientesPageState();
}

class _ConsultaClientesPageState extends State<ConsultaClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nome')),
            DataColumn(label: Text('Idade')),
            DataColumn(label: Text('Cidade')),
            DataColumn(label: Text('Telefone')),
          ],
          rows: Cliente.listaDeClientes
              .map((cliente) => DataRow(
                    cells: [
                      DataCell(Text(cliente.nome)),
                      DataCell(Text(cliente.idade.toString())),
                      DataCell(Text(cliente.cidade)),
                      DataCell(Text(cliente.telefone)),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
