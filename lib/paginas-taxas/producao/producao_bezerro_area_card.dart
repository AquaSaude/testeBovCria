import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../layouts/layout_base_card.dart';
import '../../dicas.dart';

class ProducaoBezerroAreaCard extends StatefulWidget {
  const ProducaoBezerroAreaCard({Key? key}) : super(key: key);

  @override
  State<ProducaoBezerroAreaCard> createState() =>
      _ProducaoBezerroAreaCardState();
}

class _ProducaoBezerroAreaCardState extends State<ProducaoBezerroAreaCard> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _intervaloController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  String _categoriaSelecionada = "";
  Widget? _cardResultado;

  @override
  void dispose() {
    _pesoController.dispose();
    _intervaloController.dispose();
    _areaController.dispose();
    super.dispose();
  }

  void _calcularResultado() {
    FocusScope.of(context).unfocus();

    String pesoFormatado = _pesoController.text.replaceAll(",", ".");
    String intervaloFormatado = _intervaloController.text.replaceAll(",", ".");
    String areaFormatada = _areaController.text.replaceAll(",", ".");

    double? peso = double.tryParse(pesoFormatado);
    int? intervalo = int.tryParse(intervaloFormatado);
    double? area = double.tryParse(areaFormatada);

    Widget novoCard;

    if (peso == null ||
        intervalo == null ||
        area == null ||
        peso <= 0 ||
        intervalo <= 0 ||
        area <= 0 ||
        _categoriaSelecionada.isEmpty) {
      novoCard = Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: const Text(
          "ERRO: Preencha todos os campos com valores maiores que zero e selecione uma categoria.",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      // Formula: ((peso x 365) / intervalo) / area
      double taxaFemeaAno = (peso * 365) / intervalo;
      double resultadoArea = taxaFemeaAno / area;

      String categoriaNome = "";
      switch (_categoriaSelecionada) {
        case "1":
          categoriaNome = "Novilhas de 13-24 meses";
          break;
        case "2":
          categoriaNome = "Novilhas de 25-36 meses";
          break;
        case "3":
          categoriaNome = "Vacas > 36 meses";
          break;
        default:
          categoriaNome = "Cálculo geral";
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
              "RESULTADO",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            Text(
              "• Seu resultado é: ${resultadoArea.toStringAsFixed(2)} kg/ha\n",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("• Categoria selecionada: $categoriaNome\n"),
            const Text(
              "• Verifique se o seu resultado está acima ou abaixo de 20 kg/ha. Se abaixo deste valor, veja orientações em dicas de manejo para melhorar o desempenho.",
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
                label: const Text("Dicas de Manejo",
                    style: TextStyle(fontSize: 16)),
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
    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BovCria'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBaseCard(
        titulo: "Produção de bezerro desmamado por área",
        subtitulo:
            "A eficiência é avaliada pela produção real de kg de bezerro desmamado por fêmea anualmente por área utilizada (ha). A meta é 20 Kg/ha.",
        filhos: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Categoria',
              border: OutlineInputBorder(),
            ),
            initialValue:
                _categoriaSelecionada.isNotEmpty ? _categoriaSelecionada : null,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _categoriaSelecionada = value;
                });
              }
            },
            items: const [
              DropdownMenuItem(
                  value: "1", child: Text("Novilhas de 13-24 meses")),
              DropdownMenuItem(
                  value: "2", child: Text("Novilhas de 25-36 meses")),
              DropdownMenuItem(value: "3", child: Text("Vacas > 36 meses")),
              DropdownMenuItem(value: "4", child: Text("Cálculo geral")),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _pesoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Peso do bezerro desmamado (kg)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _intervaloController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Intervalo entre partos da fêmea (dias)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _areaController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Área utilizada (ha)",
              border: OutlineInputBorder(),
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
            onPressed: _calcularResultado,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calculate),
                SizedBox(width: 8),
                Text("Calcular",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
