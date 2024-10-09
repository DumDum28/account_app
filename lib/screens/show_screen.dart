import 'package:account_app/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:account_app/screens/edit_screen.dart';

class ShowData extends StatelessWidget {
  final Transactions statement;

  ShowData({super.key, required this.statement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียด'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // แสดงข้อมูลที่ได้รับ
            const Text(
              'ประเภทรองเท้า:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.type,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'ชื่อแบรนด์',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.brand,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'รุ่น:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.model,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'ขนาดรองเท้า (UK):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              statement.size.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'จำนวนเงิน (THB):',
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('กลับ'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final updatedStatement = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditScreen(statement: statement);
                        },
                      ),
                    );
                    if (updatedStatement != null) {
                      // อัปเดต UI ในกรณีที่ข้อมูลถูกแก้ไข
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShowData(statement: updatedStatement),
                        ),
                      );
                    }
                  },
                  child: const Text('แก้ไข'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
