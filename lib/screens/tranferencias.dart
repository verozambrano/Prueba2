import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo()
      );
  }
}
 class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranferencias'),
      ),
      body: Column(
        children: [
          const Text("Hola Ingresa"),
          nombre_Input(),
          usuariogithub_Input(),
          login_btn(),
          regitro_btn(),
        ],
      ),
    );
  }
}