import 'package:flutter/material.dart';
import '../models/expense.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  static const _categorySpending = [
    (Category.food, 46.75, 500.0),
    (Category.bills, 65.00, 500.0),
    (Category.shopping, 27.00, 500.0),
    (Category.transport, 6.75, 500.0),
    (Category.entertainment, 15.99, 500.0),
    (Category.health, 2.01, 500.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Reports', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSummaryRow(),
            const SizedBox(height: 24),
            _buildBreakdownCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow() {
    return Row(
      children: [
        _statCard('Total Spent', '\$163.50', Icons.payments_outlined),
        const SizedBox(width: 12),
        _statCard('Transactions', '18', Icons.receipt_long_outlined),
        const SizedBox(width: 12),
        _statCard('Avg / Item', '\$9.08', Icons.trending_down_outlined),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF7C3AED), size: 20),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 10), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdownCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Spending by Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          ..._categorySpending.map((data) {
            final (cat, amount, budget) = data;
            return _buildCategoryBar(context, cat, amount, budget);
          }),
        ],
      ),
    );
  }

  Widget _buildCategoryBar(BuildContext context, Category cat, double amount, double budget) {
    final progress = (amount / budget).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${cat.emoji}  ${cat.label}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              Text('\$${amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7C3AED))),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF3F0FF),
              valueColor: AlwaysStoppedAnimation<Color>(Color(cat.color)),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
