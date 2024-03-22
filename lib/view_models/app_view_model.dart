import 'package:flutter/material.dart'; //เพื่อใช้งาน Widget และสไตล์ที่มีอยู่ใน Flutter

import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  // ประกาศคลาส AppViewModel ซึ่งเป็น Subclass ของ ChangeNotifier ซึ่งเป็นคลาสใน Flutter ที่ใช้ในการแจ้งเตือนวิวเมื่อมีการเปลี่ยนแปลงข้อมูล
  //ประกาศตัวแปร tasks เพื่อเก็บรายการของงาน (tasks) และ user เพื่อเก็บข้อมูลของผู้ใช้ โดยกำหนดให้ user เป็น User ที่มีชื่อ "นายเอ"
  List<Task> tasks = <Task>[];
  User user = User(" ชื่อผู้ใช้");
  // กำหนดสี เเอพในเเต่ละส่วน
  Color clrLvl1 = Colors.blue.shade50;
  Color clrLvl2 = Colors.blue.shade200;
  Color clrLvl3 = Colors.blue.shade800;
  Color clrLvl4 = Colors.blue.shade900;

  int get numTasks =>
      tasks.length; // numTasks: คืนค่าจำนวนของงานทั้งหมดในแอปพลิเคชัน

  // numTasksRemaining: คืนค่าจำนวนของงานที่ยังไม่เสร็จสิ้นในแอปพลิเคชัน
  int get numTasksRemaining => tasks
      .where((task) => !task
          .complete) // กรองสมาชิกในรายการของงาน tasks โดยเลือกเฉพาะงานที่ไม่สมบูรณ์ นั่นคืองานที่มีสถานะ complete เป็นเท็จ (false) เท่านั้น.
      .length;

  String get username => user.username; //username: คืนค่าชื่อผู้ใช้ปัจจุบัน

//addTask(newTask): เพิ่มงานใหม่ลงในรายการงานและแจ้งเตือน
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  } /*notifyListeners(): เมื่อมีการเพิ่มงานใหม่เข้าไปในลิสต์ tasks เรียบร้อยแล้ว 
  เรียกใช้เมทอด notifyListeners() เพื่อบอกว่ามีการเปลี่ยนแปลงข้อมูลในลิสต์ tasks แล้ว ซึ่งจะทราบถึงการเปลี่ยนแปลงนี้และอัปเดตหน้าจอหรือส่วนที่เกี่ยวข้องให้แสดงข้อมูลใหม่ตามที่เปลี่ยนแปลงมาใหม่นั้น*/

// getTaskValue(taskIndex): คืนค่าสถานะของงานที่ระบุโดยดัชนี (index)
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

// getTaskTitle(taskIndex): คืนค่าชื่อของงานที่ระบุโดยดัชนี (index)
  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

// deleteTask(taskIndex): ลบงานที่ระบุโดยดัชนี (index) ออกจากรายการและแจ้งเตือนวิว
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

// setTaskValue(taskIndex, taskValue): กำหนดค่าสถานะของงานที่ระบุโดยดัชนี (index)
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

// updateUsername(newUsername): อัปเดตชื่อผู้ใช้ปัจจุบัน
  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

// deleteAllTasks(): ลบงานทั้งหมดในรายการและแจ้งเตือน
  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

// deleteCompletedTasks(): ลบงานที่เสร็จสิ้นทั้งหมดออกจากรายการและแจ้งเตือน
  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

//bottomSheetBuilder(bottomSheetView, context): แสดง Bottom Sheet ด้วยการสร้างตัวจับแบบมอดอัตโนมัติและแสดงบนหน้าจอในตำแหน่งที่ระบุ
  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
