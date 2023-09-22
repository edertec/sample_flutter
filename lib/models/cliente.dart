class Cliente {
  String nome;
  int idade;
  String cidade;
  String telefone;

  // Construtor
  Cliente(
      {required this.nome,
      required this.idade,
      required this.cidade,
      required this.telefone});

  // Métodos adicionais (opcionais)
  String getInfo() {
    return 'Nome: $nome, Idade: $idade, Cidade: $cidade, Telefone: $telefone';
  }

  static List<Cliente> listaDeClientes = [
    Cliente(nome: "Alice", idade: 30, cidade: "São Paulo", telefone: "111-111"),
    Cliente(nome: "Bob", idade: 40, cidade: "Goias", telefone: "222-222"),
    // outros clientes
  ];
}
