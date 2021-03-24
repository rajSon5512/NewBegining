import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TrasactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      child:transactions.isEmpty? Column(
        children: [
          Text('No Transaction Available',
            style:Theme.of(context).textTheme.title ,),
          SizedBox(
            height: 50,),
          Container(height: 200,child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
        ],
      ) : ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue)),
                    padding: EdgeInsets.all(10),
                    child: Text('\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold
                          , fontSize: 20,
                          color: Colors.blue),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactions[index].title, style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
      )
    );

  }
}
