import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staff_maintenance_app/helpers/format_helper.dart';
import 'package:staff_maintenance_app/models/maintenance/schedule.dart';

class ScheduleView extends StatelessWidget {
  final Schedule schedule;

  const ScheduleView({Key key, this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    schedule.title,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    schedule.content ?? "",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        FormatHelper.formatDateTime(schedule.date, pattern: "dd/MM/yyyy"),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      if (schedule.odometer != null) Text("Odo: ${schedule.odometer} km", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
