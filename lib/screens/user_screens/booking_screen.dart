import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/user_screens/home.dart';
import 'package:table_calendar/table_calendar.dart';

import '../soccer_field_screen.dart';
import 'owner_clubs_screen.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // CalendarController _calendarController = CalendarController();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  String? formatedDate;
  TimeOfDay? _endTime;
  TimeOfDay? _startTime;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildHeadLine1Text(text: "Book now "),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                  headerStyle: HeaderStyle(
                    // centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false,
                  ),
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        formatedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDay);
                        // print(_selectedDay);
                        print(formatedDate);
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildElevatedTextButton(
                      titleOfButton: "Start time",
                      onPressedFunction: () async {
                        _startTime = await _selectTime(context);
                        print(_startTime!.format(context));
                      },
                    ),
                    buildElevatedTextButton(
                      titleOfButton: "End time",
                      onPressedFunction: () async {
                        _endTime = await _selectTime(context);
                        print(_endTime!.format(context));
                      },
                    ),
                  ],
                ),
                // formatedDate != null && _endTime != null && _startTime != null
                //     ?
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeadLine1Text(
                          text: formatedDate != null
                              ? "Date : $formatedDate"
                              : "please select Date"),
                      buildHeadLine1Text(
                          text: _startTime != null
                              ? "Start : ${_startTime!.format(context)}"
                              : "please select Start time"),
                      buildHeadLine1Text(
                          text: _endTime != null
                              ? "End :${_endTime!.format(context)} "
                              : "please select End time"),
                      // Text("Date : $formatedDate"),
                      // Text("Start : ${_startTime!.format(context)}"),
                      // Text("End :${_endTime!.format(context)} "),
                    ],
                  ),
                )
                // : Container(),
                ,
                formatedDate != null && _endTime != null && _startTime != null
                    ? buildElevatedTextButton(
                        titleOfButton: "Submit",
                        onPressedFunction: () {
                          showAlertDialog(context);
                        })
                    : buildElevatedTextButton(
                        titleOfButton: "Submit", backgroundColor: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TimeOfDay _time = TimeOfDay.now();

  Future<TimeOfDay> _selectTime(
    BuildContext context,
    // TimeOfDay _time,
  ) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
      // print(_time.format(context)) ;
    }
    return _time;
  }

  showAlertDialog(BuildContext context) {
    // Widget cancelButton = TextButton(
    //   child: Text("Cancel"),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // );
    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        // Perform action here
        Navigator.pop(context);
        navigateTOAndReplacement(context, Home());
      },
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      title: Container(
          // margin: EdgeInsets.all(10.0),
          child: Image.asset(
        "assets/images/Sticker.png", width: 100, height: 100,
        // fit: BoxFit.cover,
      )),
      content: buildHeadLine1Text(
          text: "Your Request send to the owner Successfully",
          textColor: Colors.grey),
      actions: [
        // cancelButton,
        continueButton,
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
