import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'paginas-taxas-producao/producao_bezerro_femea_card.dart';
import 'paginas-taxas-producao/producao_bezerro_area_card.dart';

class MenuTaxasProducao extends StatelessWidget {
  const MenuTaxasProducao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                loc.producao,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Divider(thickness: 0),
              SizedBox(
                width: 600,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ProducaoBezerroFemeaCard()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(MdiIcons.cow),
                      const SizedBox(width: 8),
                      Text(
                        loc.prodBezerroFemeaTitulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 600,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ProducaoBezerroAreaCard()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.landscape),
                      const SizedBox(width: 8),
                      Text(
                        loc.prodBezerroAreaTitulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
