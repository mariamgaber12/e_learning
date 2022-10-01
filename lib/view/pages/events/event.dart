import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Events extends StatelessWidget {
  Events({Key? key}) : super(key: key);

  final FixedExtentScrollController itemController =
      FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: mainColor,
            ),
          ),
          title: Text(
            'Events',
            style: GoogleFonts.poppins(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 7,
        ),
        body: Padding(
          padding: const EdgeInsets.all(7),
          child: SfCalendar(
            showCurrentTimeIndicator: true,
            todayHighlightColor: mainColor,
            cellBorderColor: null,
            todayTextStyle: GoogleFonts.poppins(color: Colors.white),
            allowAppointmentResize: true,
            firstDayOfWeek: 7,
            showDatePickerButton: false,
            onTap: (value) {return;},
            view: CalendarView.month,
            dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                MonthAppointmentDisplayMode.appointment),
          ),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 12);
    final DateTime endTime = startTime.add(const Duration(hours: 5));
    meetings.add(Meeting(' Event', startTime, endTime, mainColor, true));
    meetings.add(Meeting(' Event', startTime, endTime, Colors.grey.shade200, true));

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
