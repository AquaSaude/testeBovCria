import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'dicas.dart';

class _Categoria {
  final String display;
  final String value;
  const _Categoria({required this.display, required this.value});
}

const List<_Categoria> _categorias = [
  _Categoria(display: 'Novilhas de 13-24 meses', value: '1'),
  _Categoria(display: 'Novilhas de 25-36 meses', value: '2'),
  _Categoria(display: 'Vacas > 36 meses', value: '3'),
  _Categoria(display: 'Cálculo geral', value: '4'),
];

class Taxas_Calculos_2 extends StatefulWidget {
  final int? index;
  const Taxas_Calculos_2({Key? key, this.index}) : super(key: key);

  @override
  State<Taxas_Calculos_2> createState() => _Taxas_Calculos_2State();
}

class _Taxas_Calculos_2State extends State<Taxas_Calculos_2> {
  // Controllers
  final _animaisMortosCtrl = TextEditingController();
  final _inicialAnimaisCtrl = TextEditingController();
  final _bezerrosNascidosCtrl = TextEditingController();
  final _bezerrosDesmamadosCtrl = TextEditingController();
  final _femeasGestantesCtrl = TextEditingController();

  String? _categoriaSelecionada;
  Widget? _cardResultado;

  @override
  void dispose() {
    _animaisMortosCtrl.dispose();
    _inicialAnimaisCtrl.dispose();
    _bezerrosNascidosCtrl.dispose();
    _bezerrosDesmamadosCtrl.dispose();
    _femeasGestantesCtrl.dispose();
    super.dispose();
  }

  static double? _parse(String raw) =>
      double.tryParse(raw.replaceAll(',', '.'));

  String get _nomeCategoria {
    switch (_categoriaSelecionada) {
      case '1':
        return 'Novilhas de 13-24 meses';
      case '2':
        return 'Novilhas de 25-36 meses';
      case '3':
        return 'Vacas > 36 meses';
      default:
        return 'Cálculo geral';
    }
  }

  void _calcularTaxa1() {
    FocusScope.of(context).unfocus();
    final mortos = _parse(_animaisMortosCtrl.text);
    final inicial = _parse(_inicialAnimaisCtrl.text);

    final erros = <String>[];
    if (mortos == null || mortos < 0) {
      erros.add('Animais mortos: use valores ≥ 0.');
    }
    if (inicial == null || inicial <= 0) {
      erros.add('Animais iniciais: use valores > 0.');
    }
    if (_categoriaSelecionada == null) {
      erros.add('Selecione uma categoria.');
    }

    if (erros.isNotEmpty) {
      _setErro(erros);
      return;
    }

    final resultado = (mortos! * 100) / inicial!;
    _setSucesso(
      resultado: '${resultado.toStringAsPrecision(4)}%',
      categoria: _nomeCategoria,
      observacao:
          'Verifique se o seu resultado está acima ou abaixo da taxa ideal na '
          'TABELA 2 – Índices gerais do rebanho de cria.\n'
          'Veja dicas de manejo para melhorar o desempenho.',
      tabelaIndex: 2,
    );
  }

  void _calcularTaxa2() {
    FocusScope.of(context).unfocus();
    final nascidos = _parse(_bezerrosNascidosCtrl.text);
    final desmamados = _parse(_bezerrosDesmamadosCtrl.text);

    final erros = <String>[];
    if (nascidos == null || nascidos <= 0) {
      erros.add('Bezerros nascidos: use valores > 0.');
    }
    if (desmamados == null || desmamados < 0) {
      erros.add('Bezerros desmamados: use valores ≥ 0.');
    }
    if (_categoriaSelecionada == null) {
      erros.add('Selecione uma categoria.');
    }

    if (erros.isNotEmpty) {
      _setErro(erros);
      return;
    }

    final resultado = ((nascidos! - desmamados!) * 100) / nascidos;
    _setSucesso(
      resultado: '${resultado.toStringAsPrecision(4)}%',
      categoria: _nomeCategoria,
      observacao:
          'Verifique se o seu resultado está acima ou abaixo da taxa ideal na '
          'TABELA 2 – Índices gerais do rebanho de cria.\n'
          'Veja dicas de manejo para melhorar o desempenho.',
      tabelaIndex: 2,
    );
  }

  void _calcularTaxa3() {
    FocusScope.of(context).unfocus();
    final gestantes = _parse(_femeasGestantesCtrl.text);
    final desmamados = _parse(_bezerrosDesmamadosCtrl.text);

    final erros = <String>[];
    if (gestantes == null || gestantes <= 0) {
      erros.add('Fêmeas gestantes: use valores > 0.');
    }
    if (desmamados == null || desmamados < 0) {
      erros.add('Bezerros desmamados: use valores ≥ 0.');
    }
    if (_categoriaSelecionada == null) {
      erros.add('Selecione uma categoria.');
    }

    if (erros.isNotEmpty) {
      _setErro(erros);
      return;
    }

    final resultado = (desmamados! * 100) / gestantes!;
    _setSucesso(
      resultado: '${resultado.toStringAsPrecision(4)}%',
      categoria: _nomeCategoria,
      observacao:
          'Verifique se o seu resultado está acima ou abaixo da taxa ideal na '
          'TABELA 1 – Metas para os índices reprodutivos conforme categoria animal.\n'
          'Veja orientações em dicas de manejo para melhorar o desempenho.',
      tabelaIndex: 1,
    );
  }

  void _setErro(List<String> erros) {
    setState(() {
      _cardResultado = _ErroCard(mensagens: erros);
    });
  }

  void _setSucesso({
    required String resultado,
    required String categoria,
    required String observacao,
    required int tabelaIndex,
  }) {
    setState(() {
      _cardResultado = _SucessoCard(
        resultado: resultado,
        categoria: categoria,
        observacao: observacao,
        tabelaIndex: tabelaIndex,
      );
    });
  }

  Widget _dropdownCategoria() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Categoria',
        hintText: 'Selecione uma das categorias',
        border: OutlineInputBorder(),
      ),
      initialValue: _categoriaSelecionada,
      onChanged: (v) => setState(() => _categoriaSelecionada = v),
      items: _categorias
          .map((c) => DropdownMenuItem(value: c.value, child: Text(c.display)))
          .toList(),
    );
  }

  Widget _campoNumerico({
    required String label,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _botaoEnviar(VoidCallback onPressed) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: 100,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.send),
              SizedBox(width: 8),
              Text('Enviar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botaoVoltar() {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(const StadiumBorder()),
          backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
        ),
        onPressed: () => Navigator.pop(context),
        child: SizedBox(
          width: 100,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 8),
              Text('Voltar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _conteudo() {
    switch (widget.index) {
      case 1:
        return _FormCard(
          titulo: 'TAXA GERAL DE MORTALIDADE ANUAL DE REBANHO',
          descricao:
              'Esta taxa permite avaliar se os manejos nutricional e sanitário em '
              'todas as categorias do rebanho e o gerenciamento geral da propriedade '
              'estão sendo eficientes. A morte de qualquer animal implica em perda econômica.\n\n'
              'Esta taxa também pode ser calculada por categoria, possibilitando avaliar '
              'quais necessitam maior atenção.',
          campos: [
            _dropdownCategoria(),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número de animais mortos',
                controller: _animaisMortosCtrl),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número inicial de animais no rebanho',
                controller: _inicialAnimaisCtrl),
          ],
          onEnviar: _calcularTaxa1,
          cardResultado: _cardResultado,
          botaoVoltar: _botaoVoltar(),
          botaoEnviar: _botaoEnviar(_calcularTaxa1),
        );

      case 2:
        return _FormCard(
          titulo: 'TAXA ANUAL DE MORTALIDADE DE BEZERROS ATÉ DESMAMA',
          descricao:
              'Esta taxa permite avaliar a habilidade materna das fêmeas e todas as '
              'estratégias de manejo do rebanho de cria. A perda de um terneiro reflete '
              'negativamente no empenho de fazer uma fêmea conceber e gera perdas econômicas.',
          campos: [
            _dropdownCategoria(),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número de bezerros nascidos',
                controller: _bezerrosNascidosCtrl),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número de bezerros desmamados',
                controller: _bezerrosDesmamadosCtrl),
          ],
          onEnviar: _calcularTaxa2,
          cardResultado: _cardResultado,
          botaoVoltar: _botaoVoltar(),
          botaoEnviar: _botaoEnviar(_calcularTaxa2),
        );

      case 4:
        return _FormCard(
          titulo: 'TAXA DE DESMAME',
          descricao:
              'Este é o principal índice para avaliar o desempenho reprodutivo de um '
              'rebanho de cria. Um bom desempenho reprodutivo é o resultado de uma '
              'interação positiva entre fatores como genética, ambiente e manejo.',
          campos: [
            _dropdownCategoria(),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número de fêmeas gestantes',
                controller: _femeasGestantesCtrl),
            const SizedBox(height: 16),
            _campoNumerico(
                label: 'Número de bezerros desmamados',
                controller: _bezerrosDesmamadosCtrl),
          ],
          onEnviar: _calcularTaxa3,
          cardResultado: _cardResultado,
          botaoVoltar: _botaoVoltar(),
          botaoEnviar: _botaoEnviar(_calcularTaxa3),
        );

      default:
        return const Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Cálculo para este índice não implementado.'),
          ),
        );
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: constraints.maxHeight - 32),
              child: _conteudo(),
            ),
          );
        },
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final List<Widget> campos;
  final VoidCallback onEnviar;
  final Widget? cardResultado;
  final Widget botaoEnviar;
  final Widget botaoVoltar;

  const _FormCard({
    required this.titulo,
    required this.descricao,
    required this.campos,
    required this.onEnviar,
    required this.cardResultado,
    required this.botaoEnviar,
    required this.botaoVoltar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titulo,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(),
            Text(descricao, textAlign: TextAlign.justify),
            const Divider(),
            const SizedBox(height: 8),
            ...campos,
            const SizedBox(height: 24),
            botaoEnviar,
            if (cardResultado != null) ...[
              const SizedBox(height: 16),
              cardResultado!,
            ],
            const SizedBox(height: 24),
            botaoVoltar,
          ],
        ),
      ),
    );
  }
}

class _ErroCard extends StatelessWidget {
  final List<String> mensagens;
  const _ErroCard({required this.mensagens});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ERRO',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...mensagens.map(
            (m) => Text('• $m', style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _SucessoCard extends StatelessWidget {
  final String resultado;
  final String categoria;
  final String observacao;
  final int tabelaIndex;

  const _SucessoCard({
    required this.resultado,
    required this.categoria,
    required this.observacao,
    required this.tabelaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RESULTADO', style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          Text(
            '• Seu resultado: $resultado',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text('• Categoria: $categoria'),
          const SizedBox(height: 8),
          Text(observacao, textAlign: TextAlign.justify),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TabelasMetas(index: tabelaIndex)),
              ),
              icon: const Icon(MdiIcons.tableLarge),
              label: const Text('Ver tabela de referência'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Dicas()),
              ),
              icon: const Icon(MdiIcons.lightbulbOnOutline),
              label: const Text('Dicas de manejo'),
            ),
          ),
        ],
      ),
    );
  }
}
