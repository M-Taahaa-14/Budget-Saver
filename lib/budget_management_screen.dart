import 'package:flutter/material.dart';

class BudgetManagementScreen extends StatefulWidget {
  @override
  _BudgetManagementScreenState createState() => _BudgetManagementScreenState();
}

class _BudgetManagementScreenState extends State<BudgetManagementScreen> {
  double _needBudget = 50.0;
  double _expensesBudget = 30.0;
  double _savingsBudget = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Budget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            BudgetSlider(
              title: 'Need',
              value: _needBudget,
              onChanged: (value) {
                setState(() {
                  _needBudget = value;
                  _updateRemainingBudget();
                });
              },
            ),
            BudgetSlider(
              title: 'Expenses',
              value: _expensesBudget,
              onChanged: (value) {
                setState(() {
                  _expensesBudget = value;
                  _updateRemainingBudget();
                });
              },
            ),
            BudgetSlider(
              title: 'Savings',
              value: _savingsBudget,
              onChanged: (value) {
                setState(() {
                  _savingsBudget = value;
                  _updateRemainingBudget();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateRemainingBudget() {
    double total = _needBudget + _expensesBudget + _savingsBudget;
    if (total > 100.0) {
      double excess = total - 100.0;
      setState(() {
        _savingsBudget -= excess;
      });
    }
  }
}

class BudgetSlider extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;

  BudgetSlider(
      {required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$title: ${value.toStringAsFixed(1)}%'),
        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 100,
          label: '$value%',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
