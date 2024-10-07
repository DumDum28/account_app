import 'package:account_app/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:account_app/screens/edit_screen.dart';
import 'package:account_app/provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:account_app/screens/form_screen.dart';

class showData extends StatelessWidget {
  final Transactions statement;

  showData({super.key, required this.statement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลที่แสดง'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'นี่คือข้อมูลที่คุณต้องการดู',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'ข้อมูลตัวอย่าง:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              '1. ข้อมูลแรก\n'
              '2. ข้อมูลที่สอง\n'
              '3. ข้อมูลที่สาม\n',
              style: TextStyle(fontSize: 18),
            ),
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
