import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionList'),
      ),
      body: Container(
        child: transaction == null || transaction.isEmpty
            ? Center(
                child: Text(
                  'No Data Added',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        '${transaction[index].title}',
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text(
                            "From: " '${transaction[index].from}',
                          ),
                          Text(" - "),
                          Text(
                            "To: " '${transaction[index].to}',
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Cost"),
                          Text(
                            '${transaction[index].cost}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
