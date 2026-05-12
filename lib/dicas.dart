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
        appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
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
                                    _buildStackedButton(
                                        context,
                                        MdiIcons.lightbulbOnOutline,
                                        AppLocalizations.of(context)!.femeasGeral,
                                        1),
                                    _buildStackedButton(
                                        context,
                                        MdiIcons.lightbulbOnOutline,
                                        AppLocalizations.of(context)!.novilha,
                                        2),
                                    _buildStackedButton(
                                        context,
                                        MdiIcons.lightbulbOnOutline,
                                        AppLocalizations.of(context)!.acasalamento,
                                        3),
                                    _buildStackedButton(
                                        context,
                                        MdiIcons.lightbulbOnOutline,
                                        AppLocalizations.of(context)!.manejoReprod,
                                        4),
                                    _buildStackedButton(
                                        context,
                                        MdiIcons.lightbulbOnOutline,
                                        AppLocalizations.of(context)!.estacao,
                                        5),
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

  Widget _buildStackedButton(
      BuildContext context, IconData icon, String text, int index) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 450),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dicas2(index: index),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 28),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
