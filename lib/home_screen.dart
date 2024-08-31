import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savers - Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to Settings Screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            BalanceOverview(),
            SizedBox(height: 20),
            QuickActions(),
            SizedBox(height: 20),
            Expanded(
              child: TransactionList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BalanceCard(title: 'Need', amount: 500.00),
            BalanceCard(title: 'Expenses', amount: 300.00),
            BalanceCard(title: 'Savings', amount: 200.00),
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final String title;
  final double amount;

  BalanceCard({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('\$${amount.toStringAsFixed(2)}'),
      ],
    );
  }
}

class QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-expense');
          },
          child: Text('Add Expense'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/summary');
          },
          child: Text('Summary'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/budget-management');
          },
          child: Text('Budget'),
        ),
      ],
    );
  }
}

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Groceries'),
          subtitle: Text('Need - \$50.00'),
          trailing: Text('Aug 24'),
        ),
        ListTile(
          title: Text('Rent'),
          subtitle: Text('Need - \$500.00'),
          trailing: Text('Aug 24'),
        ),
      ],
    );
  }
}
