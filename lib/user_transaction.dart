import 'package:expense_manager/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'new_transaction.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> transactions=[
    Transaction(
        id: 't1',
        title: 'new shoes',
        amount: 69.90,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'new groceseries',
        amount: 69.40,
        date: DateTime.now()
    )
  ];

  void _addNewTransaction(String txtitle,double txamount){

    final newTx=Transaction(id: DateTime.now().toString(), title: txtitle, amount: txamount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TrasactionList(transactions)
      ],
    );
  }

}
