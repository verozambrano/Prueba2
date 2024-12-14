import 'package:flutter/material.dart';

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DepositoScreen(),
    );
  }
}

class DepositoScreen extends StatefulWidget {
  @override
  _DepositoScreenState createState() => _DepositoScreenState();
}

class _DepositoScreenState extends State<DepositoScreen> {
  List<dynamic> _transacciones = [];
  bool _isLoading = true;
  
  get http => null;

  @override
  void initState() {
    super.initState();
    _fetchTransacciones();
  }

  Future<void> _fetchTransacciones() async {
    final url = Uri.parse('https://jritsqmet.github.io/web-api/medico.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _transacciones = data['transactions'] ?? [];
          _isLoading = false;
        });
      } else {
        throw Exception("Error al cargar datos");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error: $e');
    }
  }

  void _showTransactionDetails(BuildContext context, Map<String, dynamic> transaccion) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Detalles de la Transacción"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Monto: ${transaccion['monto']}"),
            Text("Banco: ${transaccion['banco']}"),
            Text("Fecha: ${transaccion['fecha']}"),
            Text("Descripción: ${transaccion['descripcion']}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depósitos'),
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _transacciones.length,
              itemBuilder: (ctx, index) {
                final transaccion = _transacciones[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: transaccion['imagen'] != null
                        ? Image.network(
                            transaccion['imagen'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image, size: 50),
                    title: Text("Monto: \$${transaccion['monto']}"),
                    subtitle: Text("Banco: ${transaccion['banco']}"),
                    onTap: () => _showTransactionDetails(context, transaccion),
                  ),
                );
              },
            ),
    );
  }
}
