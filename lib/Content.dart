import 'package:bovcria/dicas2.dart';
import 'package:flutter/material.dart';
import 'Info.dart';
import 'Metas.dart';
import 'Taxas.dart';
import 'dicas.dart';
import 'voce_sabia.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import 'TabelasMetas.dart';

class Content extends StatelessWidget {
  double largura = 0;

  @override
  Widget build(BuildContext context) {
    //Ajuste da largura dos botões
    if (MediaQuery.of(context).size.width <= 320) {
      largura = 200;
    } else if (MediaQuery.of(context).size.width <= 360) {
      largura = 250;
    } else {
      largura = 300;
    }

    // Define o estilo de botão para usar em todos os TextButtons
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.lightGreen,
      disabledForegroundColor: Colors.grey,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.helloWorld,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            //Taxas
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: TextButton(
                                        style: textButtonStyle,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Taxas()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.chartBar,
                                              size: 28,
                                              color: Colors.white, // Mantém a cor do ícone
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.rate,
                                              style: TextStyle(fontSize: 22.0),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),

                            //Metas
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 90,
                                      width: largura,
                                      child: TextButton(
                                          style: textButtonStyle,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Metas()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.assignment_turned_in,
                                                size: 28,
                                                color: Colors.white, // Mantém a cor do ícone
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!.goals,
                                                style: TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          )),
                                    )
                                  ]),
                            ),

                            //Dicas
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: TextButton(
                                        style: textButtonStyle,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Dicas2()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.lightbulbOn,
                                              size: 28,
                                              color: Colors.white, // Mantém a cor do ícone
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.tips,
                                              style: TextStyle(fontSize: 22.0),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),

                            //Você sabia que...
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: TextButton(
                                        style: textButtonStyle,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VoceSabia()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.question_answer,
                                              size: 28,
                                              color: Colors.white, // Mantém a cor do ícone
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.did,
                                              style: TextStyle(fontSize: 22.0),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
