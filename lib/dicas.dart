import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'dicas2.dart';

class Dicas extends StatelessWidget {
  Widget build(BuildContext context) {
    // Define o estilo para os TextButtons dentro da classe Dicas
    final ButtonStyle dicasButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
      padding: EdgeInsets.all(10.0),
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
                              AppLocalizations.of(context)!.dicasManejo,
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
                                      style: dicasButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicas2(index: 1)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(MdiIcons.lightbulbOnOutline, color: Colors.white),
                                          SizedBox(width: 8), // Adicionado para espaçamento
                                          Text(
                                            AppLocalizations.of(context)!.femeasGeral,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: dicasButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicas2(index: 2)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(MdiIcons.lightbulbOnOutline, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            AppLocalizations.of(context)!.novilha,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: dicasButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicas2(index: 3)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(MdiIcons.lightbulbOnOutline, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            AppLocalizations.of(context)!.acasalamento,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: dicasButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicas2(index: 4)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(MdiIcons.lightbulbOnOutline, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            AppLocalizations.of(context)!.manejoReprod,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: dicasButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicas2(index: 5)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(MdiIcons.lightbulbOnOutline, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            AppLocalizations.of(context)!.estacao,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              style: dicasButtonStyle,
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
