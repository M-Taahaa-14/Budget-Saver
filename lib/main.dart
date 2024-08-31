import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_expense_screen.dart';
import 'summary_screen.dart';
import 'budget_management_screen.dart';
import 'planning_tools_screen.dart';

void main() => runApp(SaversApp());

class SaversApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savers',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
      routes: {
        '/add-expense': (context) => AddExpenseScreen(),
        '/summary': (context) => SummaryScreen(),
        '/budget-management': (context) => BudgetManagementScreen(),
        '/planning-tools': (context) => PlanningToolsScreen(),
      },
    );
  }
}
