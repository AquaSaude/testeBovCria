import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Start extends StatelessWidget {
  Widget build(BuildContext context) {
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset(
                              'images/logo.png',
                              fit: BoxFit.cover,
                              height: 100.0,
                              width: 100.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.bemvindo,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              AppLocalizations.of(context)!.objetivo,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              AppLocalizations.of(context)!.calculo,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              AppLocalizations.of(context)!.auxilio,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              AppLocalizations.of(context)!.utilize,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            )
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
