import 'package:flutter/material.dart';

class Transaction {
  final String monto;
  final String banco;
  final String imageUrl;

  Transaction({required this.monto, required this.banco, required this.imageUrl});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      monto: json['monto'],
      banco: json['banco'],
      imageUrl: json['imageUrl'],
    );
  }
}