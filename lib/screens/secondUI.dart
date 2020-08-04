import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class SecondUI extends StatelessWidget {
  final String fontFamily = 'Ubuntu';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Column(
          children: <Widget>[
            profileWidget(),
            Divider(
              color: Colors.white,
              height: 60,
            ),
            Text(
              'Welcome home, Sky.',
              style: TextStyle(
                color: Color(0xFF424249),
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: fontFamily,
              ),
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Switch Account',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontFamily: fontFamily,
                  ),
                ),
                color: Color(0xFF01B9B4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Not you?',
              style: TextStyle(
                fontFamily: fontFamily,
              ),
            ),
            SizedBox(height: 120),
            sliderBar(fontFamily),
          ],
        ),
      ),
    );
  }
}

// Profile Picture
Widget profileWidget() {
  return Container(
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/profilepic.jpg'),
      radius: 90.0,
    ),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white,
        width: 10,
      ),
    ),
  );
}

// Slider Bar
Widget sliderBar(String fontFamily) {
  return ConfirmationSlider(
    onConfirmation: () {},
    height: 50.0,
    width: 300.0,
    backgroundColor: Colors.blueGrey[50],
    foregroundColor: Colors.white,
    iconColor: Color(0xFF01B9B4),
    text: 'Slide to Continue',
    textStyle: TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
      fontFamily: fontFamily,
    ),
  );
}
