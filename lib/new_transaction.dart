import 'package:expense_manager/user_transaction.dart';
import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

  final Function addTx;
 final titlecontroller=TextEditingController();
 final amountcontroller=TextEditingController();

 NewTransaction(this.addTx);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title')
            ,controller: titlecontroller,),
            TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountcontroller,),
            FlatButton(onPressed: (){
              addTx(titlecontroller.text,double.parse(amountcontroller.text));
            },child: Text('Add Transaction',style: TextStyle(color: Colors.white),),color: Colors.blue,)
          ],
        ),),);
  }
}
