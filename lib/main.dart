import 'package:flutter/material.dart';
import 'package:flutter_application_1/seguridad/loginScreen.dart';
import 'package:flutter_application_1/seguridad/registroScren.dart';

void main(){
  runApp( const Banco());
}

class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: const Cuerpo(),
      routes:{
        '/login': (context) => const Cuerpo(),
        '/regitro': (context) => const Cuerpo(),
      } ,
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco'),
      ),
      body: Column(
        children: [
          const Text("Hola Ingresa"),
          nombre_Input(),
          usuariogithub_Input(),
          login_btn(),
          regitro_btn(),
        ],
         )
         
    );
  }
}

// ignore: non_constant_identifier_names
Widget nombre_Input() { 
  return Container( 
    margin: const EdgeInsets.all(10), 
    child: const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nombre',
    
      ),  
    ) 
  );
}

// ignore: non_constant_identifier_names
Widget usuariogithub_Input() { 
  return Container( 
    margin: const EdgeInsets.all(10), 
    child: const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Usuariogithub',
    
      ),  
    ) 
  );
}

// ignore: non_constant_identifier_names
Widget login_btn() { 
  // ignore: avoid_print
  return ElevatedButton(onPressed: ()=>print("Login"), child: const Loginscreen());
}

// ignore: non_constant_identifier_names
Widget regitro_btn() { 
  // ignore: avoid_print
  return ElevatedButton(onPressed: ()=>print("Regitro"), child: const RegistroScreen());
}