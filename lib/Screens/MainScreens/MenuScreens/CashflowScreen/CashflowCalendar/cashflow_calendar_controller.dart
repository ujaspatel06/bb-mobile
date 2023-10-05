import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class CashflowCalendarController extends GetxController {

  final RxMap<String, String> tempItems = {
    'Test A': 'Test A',
    'Test B': 'Test B',
    'Test C': 'Test C',
    'Test D': 'Test D',
    'Test E': 'Test E',
    'Test F': 'Test F',
  }.obs;
  RxString tempSelectedValue = 'Test A'.obs;
  final GlobalKey<FormState> cashflowCalenderKey = GlobalKey<FormState>();

  TextEditingController incomeNameController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();
  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();

    CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

}
