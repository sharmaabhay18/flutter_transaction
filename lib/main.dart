import 'package:flutter/material.dart';
import 'package:transaction/new_transactions.dart';
import 'package:transaction/routes.dart';
import 'package:transaction/transactionList.dart';
//import 'package:sExpense/transactionList.dart';
// import 'package:flutter/services.dart';
import 'transaction.dart';

//import 'transactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<String, WidgetBuilder> getRouteList() {
    return {
      RouteList.transactionList: (context) => TransactionList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: MyHomePage(),
      routes: getRouteList(),
      // initialRoute: RouteList.initial,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> userTransactions = [];

  void addNewTransaction(
    String txtitle,
    String txfrom,
    String txto,
    double txcost,
    /* DateTime txdateTime*/
  ) {
    final newTx = Transaction(
      title: txtitle,
      from: txfrom,
      to: txto,
      cost: txcost,
      id: DateTime.now(),
    );

    setState(
      () {
        userTransactions.add(newTx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expense App"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(2),
            children: <Widget>[
              DrawerHeader(
                child: Text('Options'),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteList.initial,
                ),
              ),
              ListTile(
                title: Text('Add Transaction'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NewTransaction(
                        addNewTransaction: addNewTransaction,
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                title: Text('List'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TransactionList(
                        transaction: userTransactions,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
