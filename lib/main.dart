import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // TODO: descomente a linha abaixo após codegen
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // Inglês
        const Locale('pt', ''), // Português
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinês *Veja os locais avançados abaixo *
        // ... outras localidades que o aplicativo suporta
      ],
      debugShowCheckedModeBanner: false,
      title: 'BovCria',
      home: Home(),
    );
  }
}
