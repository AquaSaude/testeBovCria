import 'package:bovcria/dicas.dart';
import 'package:flutter/material.dart';
import 'Metas.dart';
import 'Taxas.dart';
import 'voce_sabia.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largura = 0;

    if (MediaQuery.of(context).size.width <= 320) {
      largura = 200;
    } else if (MediaQuery.of(context).size.width <= 360) {
      largura = 250;
    } else {
      largura = 300;
    }

    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.lightGreen,
      disabledForegroundColor: Colors.grey,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.helloWorld,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 90,
                    width: largura,
                    child: TextButton(
                      style: textButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Taxas()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.chartBar,
                              size: 28, color: Colors.white),
                          Text(
                            AppLocalizations.of(context)!.rate,
                            style: const TextStyle(fontSize: 22.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    width: largura,
                    child: TextButton(
                      style: textButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Metas()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.assignment_turned_in,
                              size: 28, color: Colors.white),
                          Text(
                            AppLocalizations.of(context)!.goals,
                            style: const TextStyle(fontSize: 22.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    width: largura,
                    child: TextButton(
                      style: textButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dicas()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.lightbulbOn,
                              size: 28, color: Colors.white),
                          Text(
                            AppLocalizations.of(context)!.tips,
                            style: const TextStyle(fontSize: 22.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    width: largura,
                    child: TextButton(
                      style: textButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VoceSabia()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.question_answer,
                              size: 28, color: Colors.white),
                          Text(
                            AppLocalizations.of(context)!.did,
                            style: const TextStyle(fontSize: 22.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
