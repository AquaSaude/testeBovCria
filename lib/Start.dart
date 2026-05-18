import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                    height: 120.0,
                    width: 120.0,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.bemvindo,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.objetivo,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.calculo,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.auxilio,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.utilize,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
