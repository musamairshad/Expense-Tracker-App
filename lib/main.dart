import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/add_transaction.dart';
import './widgets/transactions.list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Quicksand',
                ),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        amount: 100, date: DateTime.now(), id: 't1', title: 'Easy Load.'),
        Transaction(
        amount: 70,
        date: DateTime.now(),
        id: 't3',
        title: 'Bike Puncture.'),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
    // jo transactions 7 days se pehle pehle ki hain wo add sirf.
  }

  void _addNewTransactions(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void addTxSheet(BuildContext cTx) {
    showModalBottomSheet(
        context: cTx,
        builder: (_) {
          return AddTransactions(_addNewTransactions);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        title: Center(
          child: Text(
            'Personal Expenses',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          
          IconButton(
            onPressed: () => addTxSheet(context),
            icon: Icon(Icons.add, size: 30,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Chart(_recentTransactions)),
            TransactionsList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTxSheet(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
