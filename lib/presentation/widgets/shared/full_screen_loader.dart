import 'package:flutter/material.dart';


class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  
  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando Datos',
      '¡Los gatos pueden ronronear a 25-150 Hz!',
      'El gato doméstico es un excelente cazador',
      'Los gatos pueden girar sus orejas 180 grados',
      'Los gatos tienen una visión nocturna increíble',
      'Falta poco...',
      'Esto está tardando más de lo esperado :(',
    ];

    return Stream.periodic( const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) return const Text('Cargando...');
              
              return Text( snapshot.data! );
            },
          ),
        ],
      ),
    );
  }
}