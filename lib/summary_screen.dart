import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Spending Overview', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 50,
                    title: 'Need',
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 30,
                    title: 'Expenses',
                    color: Colors.red,
                  ),
                  PieChartSectionData(
                    value: 20,
                    title: 'Savings',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Total Expenses'),
                    trailing: Text('\$800.00'),
                  ),
                  ListTile(
                    title: Text('Total Savings'),
                    trailing: Text('\$200.00'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
