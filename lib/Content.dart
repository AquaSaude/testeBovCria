import 'package:bovcria/Info.dart';
import 'package:bovcria/Metas.dart';
import 'package:bovcria/Taxas.dart';
import 'package:bovcria/dicas.dart';
import 'package:bovcria/voce_sabia.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'TabelasMetas.dart';

class Content extends StatelessWidget {
  double largura = 0;

  Widget build(BuildContext context) {
    //Ajuste da largura dos botões
    if (MediaQuery.of(context).size.width <= 320) {
      largura = 200;
    } else if (MediaQuery.of(context).size.width <= 360) {
      largura = 250;
    } else {
      largura = 300;
    }

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
                              AppLocalizations.of(context).helloWorld,
                              style: Theme.of(context).textTheme.headline6,
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
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Taxas()));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                MdiIcons.chartBar,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .rate,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
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
                                      child: FlatButton(
                                          color: Colors.lightGreen,
                                          textColor: Colors.white,
                                          disabledColor: Colors.grey,
                                          disabledTextColor: Colors.black,
                                          padding: EdgeInsets.all(15.0),
                                          splashColor: Colors.lightGreenAccent,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Metas()));
                                          },
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.assignment_turned_in,
                                                  size: 28,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .goals,
                                                  style:
                                                      TextStyle(fontSize: 22.0),
                                                )
                                              ],
                                            ),
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
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Dicas()));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                MdiIcons.lightbulbOn,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .tips,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
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
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VoceSabia()));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.question_answer,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .did,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
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
