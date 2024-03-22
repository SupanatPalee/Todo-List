import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

import '../../models/task_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController =
        TextEditingController(); //สร้าง TextEditingController เพื่อใช้ในการรับข้อมูลที่ผู้ใช้ป้อนเข้ามา

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      // ใช้ Consumer สำหรับการอ่านข้อมูลและแชร์ข้อมูลจาก AppViewModel ซึ่งเป็น Provider สำหรับแอปพลิเคชัน
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            // สร้าง TextField เพื่อให้ผู้ใช้ป้อนข้อมูลเกี่ยวกับงานที่ต้องการเพิ่ม โดยใช้ TextEditingController ที่เราสร้างขึ้น
            height: 80,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 250,
                child: TextField(
                    //รับข้อมูลจากผู้ใช้ เพื่อเพิ่มงานใหม่ โดยใช้ TextEditingController เพื่อรับข้อมูลที่ผู้ใช้ป้อนเข้ามา และ onSubmitted เพื่อเพิ่มงานเมื่อผู้ใช้กด Enter หรือ Submit และทำการปิด Bottom Sheet หลังจากนั้น
                    onSubmitted: (value) {
                      if (entryController.text.isNotEmpty) {
                        Task newTask = Task(entryController.text, false);
                        viewModel.addTask(newTask);
                        entryController.clear();
                      }
                      Navigator.of(context).pop(); //การปิด Bottom Sheet
                    },
                    decoration: InputDecoration(
                        //กำหนดรายละเอียดและสไตล์ของ TextField โดยใช้สีและรูปร่างที่กำหนดใน AppViewModel และใช้รูปแบบของ TextStyle เพื่อกำหนดสีและตัวหนาของข้อความ
                        contentPadding: EdgeInsets.only(bottom: 5),
                        filled: true,
                        fillColor: viewModel.clrLvl2,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: viewModel.clrLvl4,
                    autofocus: true,
                    autocorrect: false,
                    controller: entryController,
                    style: TextStyle(
                        color: viewModel.clrLvl4, fontWeight: FontWeight.w500)),
              ),
            )),
      );
    });
  }
}
