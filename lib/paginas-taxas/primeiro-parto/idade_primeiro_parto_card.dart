import 'package:bovcria/dicas.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../TabelasMetas.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class IdadePrimeiroPartoCard extends StatefulWidget {
  const IdadePrimeiroPartoCard({Key? key}) : super(key: key);

  @override
  State<IdadePrimeiroPartoCard> createState() => _IdadePrimeiroPartoCardState();
}

class _IdadePrimeiroPartoCardState extends State<IdadePrimeiroPartoCard> {
  final TextEditingController _idadePrimeiroPartoController =
      TextEditingController();
  Widget? _cardResultado;

  // Construtor dos botões
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

  // Construtor do card de resultado
  Widget _buildCardResultado(String titulo, {bool isAlerta = false}) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              titulo,
              style: isAlerta
                  ? TextStyle(
                      color: Colors.red.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                    )
                  : null,
            ),
            const Text("\nVeja orientações em:"),
            _buildBotaoAcao(
              icone: MdiIcons.tableLarge,
              texto: "Índices gerais do rebanho de cria",
              destino: TabelasMetas(
                  index: 2), 
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
    String idadeFormatado =
        _idadePrimeiroPartoController.text.replaceAll(",", ".");
    double? idade = double.tryParse(idadeFormatado);

    if (idade != null) {
      Widget novoCard;

      if (idade <= 24) {
        novoCard = _buildCardResultado("IDADE IDEAL PARA SISTEMAS INTENSIVOS");
      } else if (idade <= 36) {
        novoCard = _buildCardResultado("IDADE SATISFATÓRIA");
      } else {
        novoCard = _buildCardResultado(
          AppLocalizations.of(context)!.alerta,
          isAlerta: true,
        );
      }

      setState(() {
        _cardResultado = novoCard;
      });
    }
  }

  @override
  void dispose() {
    // É boa prática limpar o controller quando o widget for destruído
    _idadePrimeiroPartoController.dispose();
    super.dispose();
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
              AppLocalizations.of(context)!.idade,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            const Text(
                "Um dos principais fatores de desempenho das fêmeas no rebanho de cria é a idade ao primeiro parto."),
            Text(
              "\nQual é a idade (em meses) do primeiro parto de suas fêmeas?",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Idade em meses"),
              controller: _idadePrimeiroPartoController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
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
              onPressed: () {
                FocusScope.of(context).unfocus(); // Esconde o teclado
                _calcularResultado();
              },
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
