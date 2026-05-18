import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../TabelasMetas.dart';
import 'package:intl/intl.dart';

class IntervaloPartosCard extends StatefulWidget {
  const IntervaloPartosCard({Key? key}) : super(key: key);

  @override
  State<IntervaloPartosCard> createState() => _IntervaloPartosCardState();
}

class _IntervaloPartosCardState extends State<IntervaloPartosCard> {
  DateTime? _ultimoParto;
  DateTime? _partoAnterior;

  String _ultimoPartoFormatado = "";
  String _partoAnteriorFormatado = "";
  String _myActivity = "";
  Widget? _cardResultado;

  // Helper para construir os botões
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
  Widget _buildCardErro() {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "RESULTADO:",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            Text(
              "\nERRO: Por favor, selecione as duas datas para o cálculo.",
              style: TextStyle(
                color: Colors.red.withValues(alpha: 0.8),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  // Helper para o Card de Sucesso
  Widget _buildCardSucesso(int differenceInDays) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "RESULTADO:",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            Text(
              "\n• Seu resultado é $differenceInDays dias.",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.left,
            ),
            const Text(
              "\n• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 2 - Índices gerais do rebanho de cria.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            _buildBotaoAcao(
              icone: MdiIcons.tableLarge,
              texto: "Índices gerais do rebanho de cria",
              destino: TabelasMetas(index: 2),
            ),
          ],
        ),
      ),
    );
  }

  void _calcularResultado() {
    if (_ultimoParto == null || _partoAnterior == null) {
      setState(() {
        _cardResultado = _buildCardErro();
      });
      return;
    }

    // Calcula a diferença em dias
    final differenceInDays = _ultimoParto!.difference(_partoAnterior!).inDays;

    setState(() {
      _cardResultado = _buildCardSucesso(differenceInDays);
    });
  }

  // Função para abrir o DatePicker e atualizar o estado
  Future<void> _selecionarData(bool isUltimoParto) async {
    DateTime dataInicial = isUltimoParto
        ? (_ultimoParto ?? DateTime.now())
        : (_partoAnterior ?? DateTime.now());

    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: dataInicial,
      firstDate: DateTime(1900),
      lastDate: isUltimoParto ? DateTime(2100) : DateTime.now(),
    );

    if (dataSelecionada != null) {
      setState(() {
        if (isUltimoParto) {
          _ultimoParto = dataSelecionada;
          _ultimoPartoFormatado =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        } else {
          _partoAnterior = dataSelecionada;
          _partoAnteriorFormatado =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      });
    }
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
              "INTERVALO ENTRE PARTOS",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 0),
            const Text(
              "\nO intervalo entre partos é uma importante ferramenta para avaliar o desempenho do seu rebanho de cria, incluíndo seleção genética, manejos nutricional e sanitário e o gerenciamento geral da propriedade. A meta é que a fêmea tenha um bezerro por ano, ou seja repita cria todos os anos.",
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
              initialValue: _myActivity.isNotEmpty ? _myActivity : null,
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
            const SizedBox(height: 10),
            const Text("\nSelecione a data do ultimo parto"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _selecionarData(true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(_ultimoPartoFormatado.isEmpty
                      ? 'Selecione uma data'
                      : _ultimoPartoFormatado),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text("Selecione a data do parto anterior"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _selecionarData(false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(_partoAnteriorFormatado.isEmpty
                      ? 'Selecione uma data'
                      : _partoAnteriorFormatado),
                ],
              ),
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
