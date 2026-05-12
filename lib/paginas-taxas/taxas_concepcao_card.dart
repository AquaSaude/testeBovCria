import 'package:bovcria/dicas.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../TabelasMetas.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class TaxaConcepcaoCard extends StatefulWidget {
  const TaxaConcepcaoCard({Key? key}) : super(key: key);

  @override
  State<TaxaConcepcaoCard> createState() => _TaxaConcepcaoCardState();
}

class _TaxaConcepcaoCardState extends State<TaxaConcepcaoCard> {
  final TextEditingController _femeasGestantesController =
      TextEditingController();
  final TextEditingController _femeasInseminadasController =
      TextEditingController();

  String _myActivity = "";
  Widget? _cardResultado;

  @override
  void dispose() {
    _femeasGestantesController.dispose();
    _femeasInseminadasController.dispose();
    super.dispose();
  }

  // Helper para construir botões padrão
  Widget _buildBotaoAcao({
    required IconData icone,
    required String texto,
    required Widget destino,
  }) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destino),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icone),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              texto,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  // Helper para o Card de Erro
  Widget _buildCardErro(String mensagem) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              mensagem,
              style: TextStyle(
                color: Colors.red.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  // Helper para o Card de Sucesso
  Widget _buildCardSucesso(double resultado, String categoriaNome) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Resultado",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            Text(
              "• O seu resultado é: ${resultado.toStringAsPrecision(4)}%\n",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.left,
            ),
            Text(
              "• Categoria selecionada: $categoriaNome\n",
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.\n"
              "• Veja dicas de manejo para melhorar o desempenho.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            _buildBotaoAcao(
              icone: MdiIcons.tableLarge,
              texto:
                  "Metas para os índices reprodutivos conforme categoria animal",
              destino: TabelasMetas(index: 1),
            ),
            const SizedBox(height: 10),
            _buildBotaoAcao(
              icone: MdiIcons.lightbulbOnOutline,
              texto: AppLocalizations.of(context)!.dicasManejo,
              destino: Dicas(),
            ),
          ],
        ),
      ),
    );
  }

  void _calcularResultado() {
    // Esconde o teclado
    FocusScope.of(context).unfocus();

    String femeasGestantesFormatado =
        _femeasGestantesController.text.replaceAll(",", ".");
    String femeasInseminadasFormatado =
        _femeasInseminadasController.text.replaceAll(",", ".");

    int? femeasGestantes = int.tryParse(femeasGestantesFormatado);
    int? femeasInseminadas = int.tryParse(femeasInseminadasFormatado);

    Widget novoCard;

    // Validação de Erros
    if (femeasGestantes == null ||
        femeasInseminadas == null ||
        femeasGestantes < 0 ||
        femeasInseminadas <= 0 ||
        _myActivity.isEmpty) {
      String mensagem = "ERRO!\n";
      if (femeasGestantes == null || femeasGestantes < 0) {
        mensagem +=
            "\n• Número de fêmeas gestantes: Utilize valores maiores ou iguais a zero e números inteiros.";
      }
      if (femeasInseminadas == null || femeasInseminadas <= 0) {
        mensagem +=
            "\n• Número de fêmeas inseminadas ou acasaladas: Utilize valores maiores que 0 e números inteiros.";
      }
      if (_myActivity.isEmpty) {
        mensagem +=
            "\n• Categoria: Selecione uma das categorias listadas acima!";
      }

      novoCard = _buildCardErro(mensagem);
    } else {
      // Cálculo do Sucesso
      double resultado = (femeasGestantes * 100) / femeasInseminadas;
      String cat = "";

      switch (_myActivity) {
        case "1":
          cat = "Novilhas de 13-24 meses";
          break;
        case "2":
          cat = "Novilhas de 25-36 meses";
          break;
        case "3":
          cat = "Vacas > 36 meses";
          break;
        default:
          cat = "Cálculo geral";
      }

      novoCard = _buildCardSucesso(resultado, cat);
    }

    // Atualiza a tela com o card gerado
    setState(() {
      _cardResultado = novoCard;
    });
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
              AppLocalizations.of(context)!.concepcao,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            const Text(
              "\nA taxa de concepção é a capacidade que a fêmea tem em conceber um bezerro a cada inseminação ou monta natural. Sua meta é obter 60% de concepção ou mais.",
              textAlign: TextAlign.justify,
            ),
            const Divider(thickness: 0),
            Text(
              "\nSelecione uma das categorias abaixo:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Categoria',
                hintText: 'Selecione uma das categorias',
                border: OutlineInputBorder(),
              ),
              value: _myActivity.isNotEmpty ? _myActivity : null,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _myActivity = value;
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
            const Text(
              "\nNúmero de fêmeas gestantes (no diagnóstico de gestação):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Número de fêmeas gestantes"),
              controller: _femeasGestantesController,
            ),
            const Text(
              "\nNúmero de fêmeas inseminadas ou acasaladas:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Número de fêmeas inseminadas"),
              controller: _femeasInseminadasController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: _calcularResultado,
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.send),
                    Text(" Enviar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
            ),
            if (_cardResultado != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _cardResultado!,
              )
          ],
        ),
      ),
    );
  }
}
