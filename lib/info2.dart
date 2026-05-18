import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

// Import your custom layout base
import './layouts/layout_base_card.dart';

class Info2 extends StatelessWidget {
  final int index;

  const Info2({Key? key, required this.index}) : super(key: key);

  Widget _buildListItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black87, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: Colors.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      // Adjusted margin so the top header doesn't have too much gap at the very top
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildDynamicContent(BuildContext context) {
    if (index == 1) {
      final coordenadora = [
        "Dra. Adriana Kroef Tarouco (DDPA|SEAPDR)",
        "Dra. Lissandra Souto Cavalli (DDPA|SEAPDR)"
      ];
      final dev = [
        "Eduarda Soares Serpa Camboim (UFCSPA)",
        "Willian de Vargas (UFCSPA)",
        "Felipe Cardoso Martins (UFCSPA)",
        "Henry Barcelos Peitz (UFCSPA)"
      ];
      final equipe = [
        "Dra. Adriana Kroef Tarouco (DDPA|SEAPDR)",
        "Dra. Lissandra Souto Cavalli (DDPA|SEAPDR)",
        "Willian de Vargas (UFCSPA)",
        "Eduarda Soares Serpa Camboim (UFCSPA)",
        "Felipe Martins (UFCSPA)",
        "Henry Barcelos Peitz (UFCSPA)"
      ];

      return [
        _buildSectionHeader(AppLocalizations.of(context)!.coordenacao),
        ...coordenadora
            .map((name) => _buildListItem(Icons.person, name))
            .toList(),
        _buildSectionHeader(AppLocalizations.of(context)!.desenvolvimento),
        ...dev.map((name) => _buildListItem(Icons.person, name)).toList(),
        _buildSectionHeader(AppLocalizations.of(context)!.time),
        ...equipe.map((name) => _buildListItem(Icons.person, name)).toList(),
      ];
    } else if (index == 2) {
      final bibliografia = [
        "Ícones: flaticon.com",
        "Fonte: Greenwood, Clayton, and Bell. doi:10.2527/af.2017-0127",
      ];

      return [
        _buildSectionHeader(AppLocalizations.of(context)!.bibliografia),
        ...bibliografia
            .map((item) => _buildListItem(Icons.book, item))
            .toList(),
      ];
    }

    return [];
  }

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
        titulo: "",
        centralizar: false,
        filhos: [
          ..._buildDynamicContent(context),
          const SizedBox(height: 24),
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
