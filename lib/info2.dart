import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Info2 extends StatelessWidget {
  Info2({this.index});

  final index;

  Column informacoes(indice, BuildContext context) {
    if (indice == 1) {
      var dev = [
        "Eduarda Soares Serpa Camboim (UFCSPA)",
        "Willian de Vargas (UFCSPA)",
        "Felipe Cardoso Martins (UFCSPA)"
      ];

      var equipe = [
        "Dra. Adriana Kroef Tarouco (DDPA|SEAPDR)",
        "Dra. Lissandra Souto Cavalli (DDPA|SEAPDR)",
        "Willian de Vargas (UFCSPA)",
        "Eduarda Soares Serpa Camboim (UFCSPA)",
        "Felipe Martins (UFCSPA)"
      ];

      var coordenadora = [
        "Dra. Adriana Kroef Tarouco (DDPA|SEAPDR)",
        "Dra. Lissandra Souto Cavalli (DDPA|SEAPDR)"
      ];

      List<Row> listaCordenadora = new List<Row>();
      for (var i = 0; i < coordenadora.length; i++) {
        listaCordenadora.add(Row(
          children: <Widget>[
            Icon(Icons.person),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(coordenadora[i]),
              ),
            )
          ],
        ));
      }

      List<Row> listaDev = new List<Row>();
      for (var i = 0; i < dev.length; i++) {
        listaDev.add(Row(
          children: <Widget>[
            Icon(Icons.person),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(dev[i]),
              ),
            )
          ],
        ));
      }

      List<Row> listaEquipe = new List<Row>();
      for (var i = 0; i < equipe.length; i++) {
        listaEquipe.add(Row(
          children: <Widget>[
            Icon(Icons.person),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(equipe[i]),
              ),
            )
          ],
        ));
      }

      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(1),
            child: Column(
              children: <Widget>[
                //Coordenação
                Container(
                  child: Column(
                    children: <Widget>[
                      //Coordenadora
                      Container(
                        color: Colors.lightGreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                  AppLocalizations.of(context).coordenacao,
                                  style: Theme.of(context).textTheme.headline6),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: listaCordenadora,
                        ),
                      ),

                      //Dev
                      Container(
                        color: Colors.lightGreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                  AppLocalizations.of(context).desenvolvimento,
                                  style: Theme.of(context).textTheme.headline6),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: listaDev,
                        ),
                      ),

                      //Equipe
                      Container(
                        color: Colors.lightGreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(AppLocalizations.of(context).time,
                                  style: Theme.of(context).textTheme.headline6),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: listaEquipe,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );

      //bibliografia
    } else if (indice == 2) {
      var bibliografia = [
        "Ícones: flaticon.com",
        "Fonte: Greenwood, Clayton, and Bell. doi:10.2527/af.2017-0127",
      ];

      List<Row> listaBibliografia = new List<Row>();
      for (var i = 0; i < bibliografia.length; i++) {
        listaBibliografia.add(Row(
          children: <Widget>[
            Icon(Icons.book),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(6),
              child: Text(bibliografia[i]),
            ))
          ],
        ));
      }

      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.lightGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(AppLocalizations.of(context).bibliografia,
                            style: Theme.of(context).textTheme.headline6),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: listaBibliografia,
                  ),
                ),
              ],
            ),
          ),
        ],
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
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            informacoes(index, context),
                            //Back Button
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: FlatButton(
                                shape: StadiumBorder(),
                                color: Colors.lightGreen,
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.arrow_back),
                                        Text(AppLocalizations.of(context)
                                            .voltar),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
