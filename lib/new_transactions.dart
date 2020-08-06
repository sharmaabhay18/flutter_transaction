import 'package:flutter/material.dart';
import 'package:transaction/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key key, this.addNewTransaction}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // final Function validator=null;
  // final Function onSaved=null;
  final title = TextEditingController();
  final from = TextEditingController();
  final to = TextEditingController();
  final cost = TextEditingController();
  final dateTime = TextEditingController();

  List<Transaction> transaction = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Builder(
        builder: (ctx) => SafeArea(
          top: true,
          bottom: true,
          child: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                  controller: title,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'From',
                    labelText: 'From',
                  ),
                  controller: from,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'To',
                    labelText: 'To',
                  ),
                  controller: to,
                ),
                /*   TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Enter today\'s date',
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: dateTime,
                ),*/
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: 'Cost',
                    labelText: 'Cost',
                  ),
                  controller: cost,
                  // validator: (value) {
                  //       if (value.isEmpty) {
                  //         return 'Enter your last name';
                  //       }
                  //       return null;
                  //     },
                  //     onSaved: (value) {
                  //       cost=value;
                  //     },
                ),
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Yay! Item Added!'),
                    );
                    Scaffold.of(ctx).showSnackBar(snackBar);
                    widget.addNewTransaction(
                        title.text,
                        from.text,
                        to.text,
                        double.parse(
                          cost.text,
                        ) /*, DateTime.parse(dateTime.text)*/);
                    title.text = "";
                    from.text = '';
                    to.text = '';
                    cost.text = '';
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
