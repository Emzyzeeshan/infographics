import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Transform.rotate(
          angle: 32,
          child: Container(
            width: width * 1.5,
            decoration: const BoxDecoration(
              color: Color(0xff6d96fa),
            ),
          ),
        ),
        Transform.rotate(
          angle: 6,
          alignment: Alignment.bottomLeft,
          child: Container(
              width: width * 2,
              height: height * 2,
              decoration: const BoxDecoration(
                color: Color(0xffd7e2fe),
              ),
              child: Container(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 170, horizontal: 80),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal, //Vertical || Horizontal
                  children: <Widget>[
                    Transform.rotate(
                        angle: 38,
                        child: SizedBox(
                          height: 100,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 22.0),
                            child: Image.asset(
                              'assets/images/IntegralGifLogo.gif',
                            ),
                          ),
                        )),
                  ],
                ),
              ))),
        ),
        Transform.rotate(
          angle: 1,
          alignment: Alignment.topRight,
          child: Container(
            width: width * 0.5,
            decoration: const BoxDecoration(
              color: Color(0xff6d96fa),
            ),
          ),
        ),
      ],
    );
  }
}
