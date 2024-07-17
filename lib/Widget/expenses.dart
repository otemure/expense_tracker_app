import 'package:flutter/material.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/Widget/expensesList/expenses_list.dart';
import 'package:expensetracker/Widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];
  void openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => Newexpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'expenseTracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          const Text(
            'add expense',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
          IconButton(
            onPressed: () {
              openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'the chart',
            style: TextStyle(fontSize: 30.0),
          ),
          const Text('expenses list'),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    dispose();
                  },
                  child: ExpensesList(expenses: _registeredExpenses)))
        ],
      ),
    );
  }
}
