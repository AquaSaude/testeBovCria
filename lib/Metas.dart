import './layouts/layout_base_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Metas extends StatelessWidget {
  const Metas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBaseCard(
        titulo: loc!.metas.toUpperCase(),
        centralizar: true,
        filhos: <Widget>[
          Text(
            loc.metasespecificas,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          _buildStackedButton(
              context, MdiIcons.tableLarge, loc.metasIndicesRepro, 1),
          _buildStackedButton(
              context, MdiIcons.tableLarge, loc.indicesGeraisRebCria, 2),
          _buildStackedButton(
              context, MdiIcons.tableLarge, loc.especifProdBovCorte, 3),
          const SizedBox(height: 40),
          TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(const StadiumBorder()),
              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.arrow_back),
                const SizedBox(width: 8),
                Text(loc.voltar.toUpperCase()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStackedButton(
      BuildContext context, IconData icon, String text, int index) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 450),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TabelasMetas(index: index),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 55),
              SizedBox(width: 20),
              Expanded(
                child: Text(text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
