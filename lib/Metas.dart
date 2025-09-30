import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Metas extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.metas,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Card(
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context)!
                                          .metasespecificas,
                                      style:
                                      Theme.of(context).textTheme.titleLarge,
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
                                                    TabelasMetas(index: 1)));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Icon(MdiIcons.tableLarge),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .metasIndicesRepro,
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
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
                                                    TabelasMetas(index: 2)));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Icon(MdiIcons.tableLarge),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .indicesGeraisRebCria,
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
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
                                                    TabelasMetas(index: 3)));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(MdiIcons.tableLarge),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .especifProdBovCorte,
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
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
