import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class VoceSabia extends StatelessWidget {
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
                              AppLocalizations.of(context)!.vocesabia,
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
                                    Text(
                                      (AppLocalizations.of(context)!.fatores),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .fontesVocesabia,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
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
