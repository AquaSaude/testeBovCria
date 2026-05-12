import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../layouts/layout_base_card.dart';
import '../../dicas.dart';

class ProducaoBezerroFemeaCard extends StatefulWidget {
  const ProducaoBezerroFemeaCard({Key? key}) : super(key: key);

  @override
  State<ProducaoBezerroFemeaCard> createState() =>
      _ProducaoBezerroFemeaCardState();
}

class _ProducaoBezerroFemeaCardState extends State<ProducaoBezerroFemeaCard> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _intervaloController = TextEditingController();

  String _categoriaSelecionada = "";
  Widget? _cardResultado;

  @override
  void dispose() {
    _pesoController.dispose();
    _intervaloController.dispose();
    super.dispose();
  }

  void _calcularResultado(AppLocalizations loc) {
    FocusScope.of(context).unfocus();

    String pesoFormatado = _pesoController.text.replaceAll(",", ".");
    String intervaloFormatado = _intervaloController.text.replaceAll(",", ".");

    double? peso = double.tryParse(pesoFormatado);
    int? intervalo = int.tryParse(intervaloFormatado);

    Widget novoCard;

    if (peso == null ||
        intervalo == null ||
        peso <= 0 ||
        intervalo <= 0 ||
        _categoriaSelecionada.isEmpty) {
      novoCard = Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: Text(
          loc.erroPreenchimento,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      double resultado = (peso * 365) / intervalo;

      String categoriaNome = "";
      switch (_categoriaSelecionada) {
        case "1":
          categoriaNome = loc.novilhameses;
          break;
        case "2":
          categoriaNome = loc.novilhameses1;
          break;
        case "3":
          categoriaNome = loc.vacamaior;
          break;
        default:
          categoriaNome = loc.catGeral;
      }

      novoCard = Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.resultadoTitulo,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            Text(
              "• ${loc.resultadoPrefixo} ${resultado.toStringAsFixed(2)} kg\n",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("• ${loc.catSelecionadaPrefixo} $categoriaNome\n"),
            Text(
              "• ${loc.verifiqueMeta170}",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dicas()));
                },
                icon: const Icon(MdiIcons.lightbulbOnOutline),
                label:
                    Text(loc.dicasManejo, style: const TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      );
    }

    setState(() {
      _cardResultado = novoCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBaseCard(
        titulo: loc.prodBezerroFemeaTitulo,
        subtitulo: loc.prodBezerroFemeaSub,
        filhos: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: loc.categoriaLabel,
              border: const OutlineInputBorder(),
            ),
            value:
                _categoriaSelecionada.isNotEmpty ? _categoriaSelecionada : null,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _categoriaSelecionada = value;
                });
              }
            },
            items: [
              DropdownMenuItem(value: "1", child: Text(loc.novilhameses)),
              DropdownMenuItem(value: "2", child: Text(loc.novilhameses1)),
              DropdownMenuItem(value: "3", child: Text(loc.vacamaior)),
              DropdownMenuItem(value: "4", child: Text(loc.catGeral)),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _pesoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: loc.pesoBezerroLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _intervaloController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: loc.intervalo,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () => _calcularResultado(loc),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.send),
                const SizedBox(width: 8),
                Text("Enviar",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
          if (_cardResultado != null) _cardResultado!,
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
