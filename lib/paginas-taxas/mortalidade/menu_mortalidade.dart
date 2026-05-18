import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'package:bovcria/Taxas_Calculos_2.dart';

class MenuMortalidadeCard extends StatelessWidget {
  const MenuMortalidadeCard({Key? key}) : super(key: key);

  Widget _buildBotaoNavegacao(
      BuildContext context, String texto, int indexDestino) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Taxas_Calculos_2(index: indexDestino),
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
              AppLocalizations.of(context)!.motalidade,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            _buildBotaoNavegacao(
              context,
              AppLocalizations.of(context)!.taxaGeralMortAnualRabanho,
              1,
            ),
            const SizedBox(height: 15),
            _buildBotaoNavegacao(
              context,
              "Taxa anual de mortalidade de bezerros até desmama",
              2,
            ),
          ],
        ),
      ),
    );
  }
}
