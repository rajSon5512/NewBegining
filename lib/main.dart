import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/charts.dart';
import 'package:expense_manager/widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/transaction_list.dart';
import 'package:intl/intl.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        errorColor: Colors.red,
      ),
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _user_transactions=[
    Transaction(id: DateTime.now().toString(), title: 'first', amount: 10, date: DateTime.now()),
    Transaction(id: DateTime.now().toString(), title: 'second', amount: 12, date: DateTime.now()),
  Transaction(id: DateTime.now().toString(), title: 'Third', amount: 14, date: DateTime.now()),
  Transaction(id: DateTime.now().toString(), title: 'fourth', amount: 13, date: DateTime.now()),
    Transaction(id: DateTime.now().toString(), title: 'fifth', amount: 12, date: DateTime.now()),
    Transaction(id: DateTime.now().toString(), title: 'sixth', amount: 21, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions{
    return _user_transactions.where((element){
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String txtitle,double txamount,DateTime chosenDate){

    final newTx=Transaction(id: DateTime.now().toString(), title: txtitle, amount: txamount,
        date: chosenDate);

    setState(() {
      _user_transactions.add(newTx);
    });
    Navigator.of(context).pop();

  }

  void _deleteTransaction(String id){

    setState(() {
      _user_transactions.removeWhere((element){
        if(element.id==id){
         return true;
        }
        return false;
      });

    });

  }

  void _startAddNewTransaction(BuildContext context) {
    //function provide by flutter showModelBottoomSheet

    showModalBottomSheet(context: context, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            _startAddNewTransaction(context);
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransactions),
            TrasactionList(_user_transactions,_deleteTransaction),
        ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _startAddNewTransaction(context);
        },
      ) ,
    );
  }
}
