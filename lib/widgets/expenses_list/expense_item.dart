import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}', // eg: 12.3433 => 12.34
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      expense.formattedDate,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
