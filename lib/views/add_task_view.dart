import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/add_task_bottom_sheet_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      /*ช้ Consumer widget เพื่อฟังก์ชันส่งเสริมการเปลี่ยนแปลงใน viewModel 
  ของแอปที่เชื่อมโยงกับคลาสนี้ โดย Consumer widget จะทำให้ UI ถูกอัปเดตเมื่อมีการเปลี่ยนแปลงใน viewModel*/
      return SizedBox(
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.clrLvl3,
                foregroundColor: viewModel.clrLvl1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              HapticFeedback.heavyImpact();
              viewModel.bottomSheetBuilder(
                  const AddTaskBottomSheetView(), context);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            )),
      );
    });
  }
}
