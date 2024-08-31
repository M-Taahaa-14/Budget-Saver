import 'package:flutter/material.dart';

class PlanningToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planning Tools'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PlanningToolCard(
              title: 'Emergency Fund',
              description:
                  'Save six times your monthly expenses for emergencies.',
              onPressed: () {
                // Navigate to Emergency Fund planning
              },
            ),
            PlanningToolCard(
              title: 'Car Purchase',
              description: 'Plan your savings for a new car.',
              onPressed: () {
                // Navigate to Car Purchase planning
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PlanningToolCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  PlanningToolCard(
      {required this.title,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
        onTap: onPressed,
      ),
    );
  }
}
