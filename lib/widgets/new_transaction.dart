import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

  final Function addTx;

 NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final titlecontroller=TextEditingController();

 final amountcontroller=TextEditingController();

 void submitData(){

   final enterTitle=titlecontroller.text;
   final enterAmount=double.parse(amountcontroller.text);

   if(enterAmount <=0 || enterTitle.isEmpty){
     return;
   }
   widget.addTx(enterTitle,enterAmount);
 }

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
            TextField(decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted:(_)=>submitData),
            FlatButton(onPressed: (){
               submitData();
            },child: Text('Add Transaction',style: TextStyle(color: Colors.white),),color: Colors.blue,)
          ],
        ),),);
  }
}
