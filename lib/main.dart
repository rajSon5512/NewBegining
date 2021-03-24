
import 'file:///C:/Users/User/AndroidStudioProjects/expense_manager/lib/models/transaction.dart';
import 'package:expense_manager/new_transaction.dart';
import 'package:expense_manager/transaction_list.dart';
import 'package:expense_manager/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget{

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART',),
              ),
            ),
            UserTransactions()
        ],
        ),
      ),
    );
  }
}
