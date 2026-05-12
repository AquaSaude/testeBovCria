import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import './layouts/layout_base_card.dart';

class VoceSabia extends StatelessWidget {
  const VoceSabia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBaseCard(
        titulo: AppLocalizations.of(context)!.vocesabia,
        centralizar: false,
        filhos: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.fatores,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16.0, height: 1.4),
                ),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.fontesVocesabia,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade600,
                      ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.arrow_back),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.voltar,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
