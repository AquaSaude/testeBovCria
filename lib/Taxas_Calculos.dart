import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

import './layouts/layout_base_card.dart';

import 'paginas-taxas/primeiro-parto/idade_primeiro_parto_card.dart';
import 'paginas-taxas/intervalo-partos/intervalo_partos_card.dart';
import 'paginas-taxas/mortalidade/menu_mortalidade.dart';
import 'paginas-taxas/concepcao/taxas_concepcao_card.dart';
import 'paginas-taxas/producao/menu_producao.dart';
import 'paginas-taxas/desmame/menu_desmame.dart';

class Taxas_Calculos extends StatefulWidget {
  final int index;
  const Taxas_Calculos({Key? key, required this.index}) : super(key: key);

  @override
  _Taxas_CalculosState createState() => _Taxas_CalculosState();
}

class _Taxas_CalculosState extends State<Taxas_Calculos> {
  // Função auxiliar para definir o título baseado no índice
  String _getTitulo(BuildContext context) {
    switch (widget.index) {
      case 1:
        return "Idade ao Primeiro Parto";
      case 2:
        return "Taxa de Concepção";
      case 3:
        return "Taxa de Parição";
      case 4:
        return "Taxa de Desmame";
      case 5:
        return "Intervalo entre Partos";
      case 6:
        return "Taxas de Mortalidade";
      case 7:
        return "Taxas de Produção";
      default:
        return "Cálculos";
    }
  }

  Widget _buildConteudoTaxa() {
    switch (widget.index) {
      case 1:
        return const IdadePrimeiroPartoCard();
      case 2:
        return const TaxaConcepcaoCard();
      case 4:
        return const MenuDesmameCard();
      case 5:
        return const IntervaloPartosCard();
      case 6:
        return const MenuMortalidadeCard();
      case 7:
        return const MenuTaxasProducao();
      default:
        return const Center(child: Text("Em desenvolvimento..."));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: LayoutBaseCard(
        titulo: _getTitulo(context).toUpperCase(),
        centralizar: false,
        filhos: [
          _buildConteudoTaxa(),
          const SizedBox(height: 40),
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
