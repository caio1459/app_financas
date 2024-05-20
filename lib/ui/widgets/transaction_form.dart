import 'package:app_financas/ui/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  const TransactionForm({super.key, required this.addTransaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final dateController = TextEditingController();
  final message = Message();
  DateTime? selectedDate;

  // Limpar os controladores quando o widget é descartado
  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Cria um seletor de data
    void presentDatePicker() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat.yMMMd().format(selectedDate!);
      });
    }

    onSubmit() {
      final title = titleController.text;
      final value = double.tryParse(valueController.text) ?? 0;

      if (title.trim().isEmpty || value <= 0 || selectedDate == null) {
        message.show(
          context: context,
          title: "Alerta",
          text: "Há campos que não foram preenchidos",
        );
        return;
      }
      //Acessa todos os parametros do componente
      widget.addTransaction(title, value, selectedDate!);
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
              controller: titleController,
              onSubmitted: (_) => onSubmit(), //Funciona como o keyPress
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => onSubmit(), //Funciona como o keyPress
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Selecione uma data',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: presentDatePicker,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text("Nova Transação"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
