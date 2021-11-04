import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dicas2 extends StatelessWidget {
  Dicas2({this.index});

  final index;

  //1 - FÊMEAS EM GERAL
  //2 - NOVILHAS
  //3 - ESTAÇÃO DE ACASALAMENTO
  //4 - MANEJO REPRODUTORES
  //5 - ESTAÇÃO DE NASCIMENTOS
  Card _conteudo(index, context) {
    if (index == 1) {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).femeasGeral,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).facaPressao,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back),
                        Text(AppLocalizations.of(context).voltar),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (index == 2) {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).novilha,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).obterFemeasPrec,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back),
                        Text(AppLocalizations.of(context).voltar),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (index == 3) {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).estacaoAcasalamento,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).estabelecaEstacao,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back),
                        Text(AppLocalizations.of(context).voltar),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (index == 4) {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).manejoReprod,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).utilizeRepMerito,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back),
                        Text(AppLocalizations.of(context).voltar),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (index == 5) {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).estacao,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).reservePotreiroMaternidade,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back),
                        Text(AppLocalizations.of(context).voltar),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
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
