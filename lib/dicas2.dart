import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Dicas2 extends StatelessWidget {
  Dicas2({this.index});

  final index;

  //1 - FÊMEAS EM GERAL
  //2 - NOVILHAS
  //3 - ESTAÇÃO DE ACASALAMENTO
  //4 - MANEJO REPRODUTORES
// O mapa armazena os dados para cada índice, eliminando a necessidade de múltiplos if-else.
  final Map<int, Map<String, dynamic>> _conteudoData = {
    1: {
      'title': (context) => AppLocalizations.of(context)!.femeasGeral,
      'text': (context) => AppLocalizations.of(context)!.facaPressao,
    },
    2: {
      'title': (context) => AppLocalizations.of(context)!.novilha,
      'text': (context) => AppLocalizations.of(context)!.obterFemeasPrec,
    },
    3: {
      'title': (context) => AppLocalizations.of(context)!.estacaoAcasalamento,
      'text': (context) => AppLocalizations.of(context)!.estabelecaEstacao,
    },
    4: {
      'title': (context) => AppLocalizations.of(context)!.manejoReprod,
      'text': (context) => AppLocalizations.of(context)!.utilizeRepMerito,
    },
    5: {
      'title': (context) => AppLocalizations.of(context)!.estacao,
      'text': (context) => AppLocalizations.of(context)!.reservePotreiroMaternidade,
    },
  };

  Card _conteudo(int index, BuildContext context) {
    // Define o estilo do botão para reutilização
    final ButtonStyle backButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

    // Obtém os dados do mapa com base no índice
    final data = _conteudoData[index];

    if (data == null) {
      // Retorna um Card de erro caso o índice não seja encontrado
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(AppLocalizations.of(context)!.error),
        ),
      );
    }

    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              data['title'](context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      data['text'](context),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: backButtonStyle,
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.voltar,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //Variaveis
    var title = 'BovCria';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,

      //Estrutura base de um app
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    _conteudo(index, context),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
