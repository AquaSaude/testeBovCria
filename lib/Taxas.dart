import 'package:bovcria/Taxas_Calculos.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Taxas extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.taxas,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Card(
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 1,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .idade),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 2,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .motalidade),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 3,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .intervalo),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 4,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .concepcao),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 5,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .paricao),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 6,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .desmame),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Taxas_Calculos(
                                                      index: 7,
                                                    )));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.chartLine),
                                              Text(AppLocalizations.of(context)!
                                                  .desmame),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(StadiumBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back),
                                      Text(AppLocalizations.of(context)!.voltar),
                                    ],
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
