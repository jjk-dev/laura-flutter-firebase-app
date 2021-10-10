import 'package:app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Gallery extends StatelessWidget {
  Gallery({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      customerId: 1,
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      customerId: 2,
      amount: 3000,
      date: DateTime.now(),
    ),
  ];

  String formatDate(DateTime tx) {
    return "${tx.year.toString()}년 ${tx.month.toString()}월 ${tx.day.toString()}일";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tx) {
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              elevation: 4,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      10,
                      30,
                      30,
                      30,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      tx.amount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.customerId.toString() + "번 고객님의 꽃",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        formatDate(tx.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
