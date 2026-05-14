import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import 'taxa_desmame_card.dart';
import 'relacao_vaca_bezerro.dart';

class MenuDesmameCard extends StatelessWidget {
  const MenuDesmameCard({Key? key}) : super(key: key);

  Widget _buildBotaoNavegacao(
      BuildContext context, String texto, Widget destino) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        minimumSize: WidgetStateProperty.all(const Size(400, 50)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destino,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: <Widget>[
            Icon(MdiIcons.chartLine),
            Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Taxas de desmame",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            _buildBotaoNavegacao(
              context,
              "Taxas de desmame",
              const TaxaDesmameCard(),
            ),
            const SizedBox(height: 15),
            _buildBotaoNavegacao(
              context,
              "Relação Vaca/Bezerro",
              const RelacaoVacaBezerroCard(),
            ),
          ],
        ),
      ),
    );
  }
}
