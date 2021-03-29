
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;


class NewTransaction extends StatefulWidget {

  final Function addTx;
 NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final titlecontroller=TextEditingController();
DateTime _selectedDate;
 final amountcontroller=TextEditingController();

 void submitData(){

   final enterTitle=titlecontroller.text;
   final enterAmount=double.parse(amountcontroller.text);
   final chosen_date=_selectedDate;

   developer.log(chosen_date.toString(),name: 'rocky');

   if(enterAmount <=0 || enterTitle.isEmpty || chosen_date==null){
     return;
   }
   widget.addTx(enterTitle,enterAmount,chosen_date);
 }

  void _presentDatePicker(){
   showDatePicker(context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2021), lastDate: DateTime.now())
   .then((value) {
     if(value==null){
       return;
     }
     _selectedDate=value;
     print(_selectedDate);
   });

 }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title')
            ,controller: titlecontroller,),
            TextField(decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted:(_)=>submitData),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(_selectedDate==null?'No Date Chosen': DateFormat.yMd().format(_selectedDate)),
                  FlatButton(onPressed: _presentDatePicker,textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),),
                ],
                
              ),
            ),
            Container(
            alignment: Alignment.bottomRight,
              child: FlatButton(
                color:Theme.of(context).primaryColor,
                onPressed: (){
                 submitData();
              },child: Text('Add Transaction',style: TextStyle(color: Colors.white,)),
              ),
            )],
        ),),);
  }
}
