import 'package:flutter/material.dart';

class Income {
  final String date;
  final double amount;
  final String description;

  Income({
    required this.date,
    required this.amount,
    required this.description,
  });
}

class IncomeTabPage extends StatefulWidget {
  const IncomeTabPage({super.key});

  @override
  State<IncomeTabPage> createState() => _IncomeTabPageState();
}

class _IncomeTabPageState extends State<IncomeTabPage> {
  final List<Income> incomes = [
    Income(
      date: "2024-06-01",
      amount: 100.0,
      description: "Chuyến đi từ A đến B",
    ),
    Income(
      date: "2024-06-02",
      amount: 150.0,
      description: "Chuyến đi từ C đến D",
    ),
    Income(
      date: "2024-06-03",
      amount: 200.0,
      description: "Chuyến đi từ E đến F",
    ),
    // Thêm nhiều thu nhập khác ở đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB81736),
        elevation: 0,
        title: const Text(
          "Thu nhập của bạn",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: incomes.length,
        itemBuilder: (context, index) {
          final income = incomes[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.monetization_on, color: Color(0xffB81736)),
              title: Text(
                "${income.date}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${income.description}\nSố tiền: \$${income.amount}",
                style: TextStyle(height: 1.5),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
