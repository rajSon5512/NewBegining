import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';


class TrasactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TrasactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((e){
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  padding: EdgeInsets.all(10),
                  child: Text('\$${e.amount.toString()}',
                    style: TextStyle(fontWeight:FontWeight.bold
                        ,fontSize: 20,
                        color: Colors.blue),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text(DateFormat.yMMMd().format(e.date),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
