import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

NewsPaper(bool extended, BuildContext context) {
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    // DateTime(2021, 8, 13),
  ];

  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Icon(
                Icons.newspaper,
                size: 40,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                'News Paper',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Icon(Icons.refresh),
              onTap: () {},
            ),
            GestureDetector(
              child: Icon(Icons.calendar_month),
              onTap: () async {
                final format = DateFormat("yyyy-MM-dd");
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                          content: Column(
                        children: [
                          Text('Basic date field (${format.pattern})'),
                          DateTimeField(
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                          ),
                        ],
                      ));
                    }));
              },
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.white,
        ),
        Expanded(
          child: Card(
            color: Color(0xffd7e2fe),
            child: ListView.builder(
                itemCount: 16,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      tileColor: Colors.white,
                      title: Text('Economic Times'),
                      subtitle: extended == false
                          ? Text(
                              'JP Nadda spends 12 days a month outside Delhi in run-up to state polls',
                              style: TextStyle(),
                            )
                          : Text(''),
                    ),
                  );
                })),
          ),
        ),
      ]);
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
