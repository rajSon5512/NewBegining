
import 'package:expense_manager/models/transaction.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/expense_manager/lib/widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/expense_manager/lib/widgets/transaction_list.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber
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
   /* Transaction(
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
    ),*/
  ];

  void _addNewTransaction(String txtitle,double txamount){

    final newTx=Transaction(id: DateTime.now().toString(), title: txtitle, amount: txamount,
        date: DateTime.now());

    setState(() {
      _user_transactions.add(newTx);
    });

    Navigator.of(context).pop();

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
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART',),
              ),
            ),
            TrasactionList(_user_transactions),
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
