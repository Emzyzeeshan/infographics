import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewsPaper extends StatefulWidget {
  bool extended;
  NewsPaper(this.extended, {super.key});

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  final List<String> items = [
    'Party',
    'District',
    'Constituency',
    'Candidate',
  ];
  String? selectedValue;
  bool datefilter = false;
  bool filter = false;
  final format = DateFormat("yyyy-MM-dd");
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    // DateTime(2021, 8, 13),
  ];
  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.filter_alt_rounded),
                onTap: () {
                  setState(() {
                    filter = !filter;
                    datefilter = false;
                  });
                },
              ),
              GestureDetector(
                child: Icon(Icons.calendar_month),
                onTap: () {
                  setState(() {
                    datefilter = !datefilter;
                    filter = false;
                  });
                },
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
          filter == true
              ? Text(
                  'Choose Filter: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          filter == true
              ? DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    // key: DashboardDropdownkey,
                    hint: Text(
                      'Select filter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map<DropdownMenuItem<String>>(
                            (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 50,
                    buttonWidth: MediaQuery.of(context).size.width,
                    itemHeight: 40,
                    iconSize: 14,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[200],
                    ),
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownPadding: null,
                    dropdownElevation: 8,
                    dropdownOverButton: true,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    dropdownFullScreen: false,
                    dropdownDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    dropdownMaxHeight: MediaQuery.of(context).size.height * 0.5,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                    isDense: true,
                  ),
                )
              : Container(),
          datefilter == true
              ? Text(
                  'Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : Container(),
          datefilter == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('From: '),
                            DateTimeField(
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'dd-mm-yyyy',
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  fillColor: Colors.white,
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
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('To : '),
                            DateTimeField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  filled: true,
                                  hintText: 'dd-mm-yyyy',
                                  isDense: true,
                                  fillColor: Colors.white,
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
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
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
                        subtitle: widget.extended == false
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
    ;
  }
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
