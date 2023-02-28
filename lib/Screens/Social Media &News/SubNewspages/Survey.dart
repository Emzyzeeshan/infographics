import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  bool extended;
  Survey(this.extended, {super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final List<String> items = [
    'NEXT_CHIEF_MINISTER',
    'RATE_KCR_GOVERNMENT',
    'POPULAR_SCHEME',
    'PARTY_LOKSABHA_ELECTION',
    'PARTY_LAST_ASSEMBLY_ELECTION',
    'PARTY_UPCOMING_ASSEMBLY_ELECTI',
    'DISTRICT',
    'AC',
    'OCCUPATION',
    'EDUCATION',
    'RELIGION',
    'CASTE',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.8,
            strokeAlign: 1,
            color: Color(0xff6d96fa),
          ),
          borderRadius: BorderRadius.circular(10)),
      color: Color(0xffd7e2fe),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/survey2.png',
                    height: 30,
                    width: 30,
                  ),
                  Flexible(
                    child: Text(
                      'Survey',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // key: DashboardDropdownkey,
                  hint: Text(
                    'ok',
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
                    // setState(() {
                    //   Selectedinput = value;
                    //   print(Selectedinput);
                    //   Selectedinput = Selectedinput;
                    //   // pageController.jumpToPage(
                    //   //     data['dashBordlist']
                    //   //         .indexOf(selectedValue));
                    //   // print(data['dashBordlist']
                    //   //     .indexOf(selectedValue));
                    // });
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
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color(0xffd7e2fe),
                  child: ListView.builder(
                      itemCount: 16,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ListTile(
                            style: ListTileStyle.drawer,
                            tileColor: Colors.white,
                            title: Text('KCR (K. CHANDRASHEKAR RAO)'),
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
            ]),
      ),
    );
    ;
  }
}
