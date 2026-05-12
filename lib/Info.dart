import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import 'info2.dart';
import '/layouts/layout_base_card.dart';
import '/layouts/layout_base_button.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    // Width logic
    double largura = 0;
    if (MediaQuery.of(context).size.width <= 320) {
      largura = 200;
    } else if (MediaQuery.of(context).size.width <= 360) {
      largura = 250;
    } else {
      largura = 300;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBaseCard(
        titulo: AppLocalizations.of(context)!.info,
        filhos: [
          CustomMenuButton(
            icon: Icons.people,
            text: AppLocalizations.of(context)!.time,
            width: largura,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Info2(index: 1)),
              );
            },
          ),
          const SizedBox(height: 16),
          CustomMenuButton(
            icon: Icons.book,
            text: AppLocalizations.of(context)!.bibliografia,
            width: largura,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Info2(index: 2)),
              );
            },
          ),
          const SizedBox(height: 16),
          CustomMenuButton(
            icon: Icons.email,
            text: AppLocalizations.of(context)!.contato,
            width: largura,
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'tecbovapp@gmail.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'BovCria',
                }),
              );
              if (!await launchUrl(emailLaunchUri)) {
                throw Exception(
                    'Não foi possível abrir o aplicativo de e-mail.');
              }
            },
          ),
          const SizedBox(height: 16),
          CustomMenuButton(
            icon: Icons.share,
            text: AppLocalizations.of(context)!.share2,
            width: largura,
            onPressed: () {
              Share.share(AppLocalizations.of(context)!.share);
            },
          ),
        ],
      ),
    );
  }
}
