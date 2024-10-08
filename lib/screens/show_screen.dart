import 'package:account_app/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:account_app/screens/edit_screen.dart';

class showData extends StatelessWidget {
  final Transactions statement;

  showData({super.key, required this.statement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ชื่อรายการ:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.brand,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'จำนวนเงิน:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.amount.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'วันที่ทำรายการ:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.date.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20.0),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // จัดตำแหน่งปุ่มให้อยู่กลาง
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('กลับ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditScreen(statement: statement);
                        },
                      ),
                    );
                  },
                  child: Text('แก้ไข'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
