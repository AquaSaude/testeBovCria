import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'producao_bezerro_femea_card.dart';
import 'producao_bezerro_area_card.dart';

class MenuTaxasProducao extends StatelessWidget {
  const MenuTaxasProducao({Key? key}) : super(key: key);

  Widget _buildBotaoNavegacao(
      BuildContext context, String texto, IconData icone, Widget destino) {
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
            Icon(icone),
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
    final loc = AppLocalizations.of(context)!;

    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              loc.producao,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            _buildBotaoNavegacao(
              context,
              loc.prodBezerroFemeaTitulo,
              MdiIcons.cow,
              const ProducaoBezerroFemeaCard(),
            ),
            const SizedBox(height: 15),
            _buildBotaoNavegacao(
              context,
              loc.prodBezerroAreaTitulo,
              Icons.landscape,
              const ProducaoBezerroAreaCard(),
            ),
          ],
        ),
      ),
    );
  }
}
