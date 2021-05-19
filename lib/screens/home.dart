import 'package:conversor_moedas/components/text_field.dart';
import 'package:conversor_moedas/network/api_request.dart';
import 'package:flutter/material.dart';

const request = ("https://api.hgbrasil.com/finance/quotations?key=12caf119");

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  void realChanged(String text) {
    print(text);
  }

  void euroChanged(String text) {
    print(text);
  }

  void dolarChanged(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('\$ Conversor de Moedas \$'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text('Carregando Dados...'),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro ao carregar dado!'),
                  );
                } else {
                  dolar = snapshot.data['results']['currencies']['USD']['buy'];
                  euro = snapshot.data['results']['currencies']['EUR']['buy'];
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 150,
                          color: Colors.amber,
                        ),
                        BuildTextField(
                            function: realChanged,
                            prefix: 'R\$',
                            label: 'Reais',
                            controller: realController),
                        Divider(),
                        BuildTextField(
                            function: euroChanged,
                            prefix: 'EUR',
                            label: 'Euros',
                            controller: euroController),
                        Divider(),
                        BuildTextField(
                            function: dolarChanged,
                            prefix: 'US\$',
                            label: 'Dólares',
                            controller: dolarController),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
