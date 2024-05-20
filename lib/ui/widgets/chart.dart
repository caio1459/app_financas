import 'package:app_financas/models/transaction.dart';
import 'package:app_financas/ui/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //Lista das transações recentes
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  //Forma os dias da semana
  DateTime _getWeekDay(int pos) {
    return DateTime.now().subtract(
      Duration(days: pos),
    );
  }

  //Pega a primeira letra do dia da semana
  String _getWeekDayLetter(int pos, DateTime weekDay) {
    //Retorna a primeira letra do dia da semana
    return DateFormat.E().format(weekDay)[0];
  }

  //Soma o valor total das transações do mesmo dia
  double _getTotalSum(DateTime weekDay) {
    double totalSum = 0;
    for (var i = 0; i < recentTransactions.length; i++) {
      bool sameDay = recentTransactions[i].date.day == weekDay.day;
      bool sameMonth = recentTransactions[i].date.month == weekDay.month;
      bool sameYear = recentTransactions[i].date.year == weekDay.year;
      if (sameDay && sameMonth && sameYear) {
        totalSum += recentTransactions[i].value;
      }
    }
    return totalSum;
  }

  List<Map> get _groupdTransaction {
    return List.generate(7, (index) {
      final weekDay = _getWeekDay(index);
      return {
        'day': _getWeekDayLetter(index, weekDay),
        'value': _getTotalSum(weekDay),
      };
    }).reversed.toList();
  }

  //Retorna a soma total da semana
  double get _weekTotalValue {
    return _groupdTransaction.fold(0, (sum, item) => sum + item['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupdTransaction.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                value: e['value'],
                label: e['day'],
                percentege: e['value'] / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
