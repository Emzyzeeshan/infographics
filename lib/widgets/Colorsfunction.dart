import 'package:flutter/material.dart';

class Colorpanel extends StatefulWidget {
  VoidCallback? ontapGreen;
  VoidCallback? ontapblue;
  VoidCallback? ontapred;
  VoidCallback? ontappink;
  Colorpanel(
      {this.ontapGreen,
      this.ontapblue,
      this.ontapred,
      this.ontappink,
      super.key});

  @override
  State<Colorpanel> createState() => _ColorpanelState();
}

class _ColorpanelState extends State<Colorpanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Color Palette',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: widget.ontapGreen,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.green.shade500,
                              Colors.green.shade100,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.ontapblue,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade500,
                            Colors.blue.shade100,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.ontappink,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.pink.shade500,
                            Colors.pink.shade100,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.ontapred,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.red.shade500,
                            Colors.red.shade100,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
