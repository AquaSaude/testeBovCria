import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../layouts/layout_base_card.dart';
import '../../dicas.dart';
import '../../voce_sabia.dart';
import '../../TabelasMetas.dart';

class RelacaoVacaBezerroCard extends StatefulWidget {
  const RelacaoVacaBezerroCard({Key? key}) : super(key: key);

  @override
  State<RelacaoVacaBezerroCard> createState() => _RelacaoVacaBezerroCardState();
}

class _RelacaoVacaBezerroCardState extends State<RelacaoVacaBezerroCard> {
  final TextEditingController _pesoBezerroCtrl = TextEditingController();
  final TextEditingController _pesoMaeCtrl = TextEditingController();

  String _categoriaSelecionada = "";
  Widget? _cardResultado;

  @override
  void dispose() {
    _pesoBezerroCtrl.dispose();
    _pesoMaeCtrl.dispose();
    super.dispose();
  }

  void _calcularResultado() {
    FocusScope.of(context).unfocus();

    double? pesoBezerro =
        double.tryParse(_pesoBezerroCtrl.text.replaceAll(",", "."));
    double? pesoMae = double.tryParse(_pesoMaeCtrl.text.replaceAll(",", "."));

    Widget novoCard;

    if (pesoBezerro == null ||
        pesoMae == null ||
        pesoBezerro <= 0 ||
        pesoMae <= 0 ||
        _categoriaSelecionada.isEmpty) {
      novoCard = Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade200)),
        child: const Text(
            "ERRO: Preencha todos os campos corretamente (apenas números maiores que zero) e selecione uma categoria.",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      );
    } else {
      // FÓRMULA: Peso do bezerro desmamado x 100 / peso de sua mãe
      double resultado = (pesoBezerro * 100) / pesoMae;

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
      }

      novoCard = Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("RESULTADO", style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            Text("• Seu resultado é: ${resultado.toStringAsFixed(2)}%\n",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("• Categoria selecionada: $categoriaNome\n"),
            const Text(
              "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 1. Veja orientações em dicas de manejo e \"você sabia que...\", para melhorar o desempenho.", // [cite: 76]
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(12)),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TabelasMetas(index: 1))),
                icon: const Icon(MdiIcons.tableLarge),
                label: const Text("Metas (Tabela 1)"),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(12)),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dicas())),
                icon: const Icon(MdiIcons.lightbulbOnOutline),
                label: const Text("Dicas de Manejo"),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(12)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const VoceSabia())),
                icon: const Icon(Icons.question_answer),
                label: const Text("Você Sabia Que..."),
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
          backgroundColor: Colors.green),
      body: LayoutBaseCard(
        centralizar: false,
        titulo: "RELAÇÃO VACA/BEZERRO\n(DESMAME IDEAL)",
        subtitulo:
            "A sua fêmea é uma boa mãe? Qual percentual do peso vivo da vaca é convertido em kg de peso do bezerro à desmama em um mesmo grupo de manejo? Você pode avaliar a habilidade materna de suas fêmeas, assim como o manejo nutricional das matrizes e de seus bezerros calculando a relação vaca/bezerro.", // [cite: 61, 62, 63]
        filhos: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                labelText: 'Categoria', border: OutlineInputBorder()),
            initialValue:
                _categoriaSelecionada.isNotEmpty ? _categoriaSelecionada : null,
            onChanged: (value) {
              if (value != null) setState(() => _categoriaSelecionada = value);
            },
            items: const [
              DropdownMenuItem(
                  value: "1", child: Text("Novilhas de 13-24 meses")),
              DropdownMenuItem(
                  value: "2", child: Text("Novilhas de 25-36 meses")),
              DropdownMenuItem(value: "3", child: Text("Vacas > 36 meses")),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _pesoBezerroCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
                labelText: "Peso do bezerro desmamado (Kg)",
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _pesoMaeCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
                labelText: "Peso da mãe (Kg)", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
            onPressed: _calcularResultado,
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.send),
              SizedBox(width: 8),
              Text("Calcular",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
            ]),
          ),
          if (_cardResultado != null) _cardResultado!,
        ],
      ),
    );
  }
}
