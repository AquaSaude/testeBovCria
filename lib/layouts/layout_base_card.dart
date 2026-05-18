import 'package:flutter/material.dart';

class LayoutBaseCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final List<Widget> filhos;
  final bool centralizar;

  const LayoutBaseCard({
    Key? key,
    required this.titulo,
    this.subtitulo = "",
    this.centralizar = true,
    required this.filhos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: double.infinity,
          alignment: centralizar ? Alignment.center : Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: centralizar
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: <Widget>[
                if (titulo.isNotEmpty) ...[
                  Text(
                    titulo,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                ],
                if (subtitulo.isNotEmpty) ...[
                  Text(
                    subtitulo,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
                ...filhos,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
