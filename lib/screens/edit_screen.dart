import 'package:account_app/main.dart';
import 'package:account_app/models/transactions.dart';
import 'package:account_app/provider/transaction_provider.dart';
import 'package:account_app/screens/show_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var formKey = GlobalKey<FormState>();
  var typeController = TextEditingController();
  var brandController = TextEditingController();
  var modelController = TextEditingController();
  var sizeController = TextEditingController();
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    brandController.text = widget.statement.brand;
    amountController.text = widget.statement.amount.toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('แบบฟอร์มแก้ไขข้อมูล'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อรายการ',
                  ),
                  autofocus: false,
                  controller: brandController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'จำนวนเงิน',
                  ),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (String? input) {
                    try {
                      double amount = double.parse(input!);
                      if (amount < 0) {
                        return 'กรุณากรอกข้อมูลมากกว่า 0';
                      }
                    } catch (e) {
                      return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                    }
                  },
                ),
                TextButton(
                    child: const Text('แก้ไขข้อมูล'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // create transaction data object
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            type: typeController.text,
                            brand: brandController.text,
                            model: modelController.text,
                            size: double.parse(sizeController.text),
                            amount: double.parse(amountController.text),
                            date: DateTime.now());

                        // add transaction data object to provider
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);
                        // เพิ่มปุ่ม pop
                        Navigator.pop(context);
                      }
                    })
              ],
            )));
  }
}
