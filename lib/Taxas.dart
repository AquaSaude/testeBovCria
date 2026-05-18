import 'package:bovcria/Taxas_Calculos.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import './layouts/layout_base_card.dart';

class Taxas extends StatelessWidget {
  const Taxas({Key? key}) : super(key: key);

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
        titulo: AppLocalizations.of(context)!.taxas.toUpperCase(),
        centralizar: false,
        filhos: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              runSpacing: 15,
              children: <Widget>[
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.idade, 1),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.concepcao, 2),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.paricao, 3),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.desmame, 4),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.intervalo, 5),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.motalidade, 6),
                _buildGridButton(context, MdiIcons.chartLine,
                    AppLocalizations.of(context)!.producao, 7),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(const StadiumBorder()),
              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.arrow_back),
                const SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.voltar),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, IconData icon, String text, int index) {
    return SizedBox(
      width: 180,
      height: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Taxas_Calculos(index: index),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 55),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
