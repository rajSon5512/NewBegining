
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function delete_function;


  TrasactionList(this.transactions,this.delete_function);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 550,
      padding: EdgeInsets.all(10),
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
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}'))),),
                  title: Text(transactions[index].title
                  ,style: Theme.of(context).textTheme.title,),
                  subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                trailing: IconButton(icon: Icon(Icons.delete),color: Theme.of(context).errorColor,
                onPressed: (){
                  delete_function(transactions[index].id);
                },),
              ),
            );
          },
          itemCount: transactions.length,
      )
    );

  }
}
