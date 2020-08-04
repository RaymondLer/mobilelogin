import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobilelogin/screens/secondUI.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/03.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                    maxHeight: 90,
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: 'lifyn',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          letterSpacing: 5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Living Together',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF01B9B4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: InputsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputsWidget extends StatefulWidget {
  InputsWidget({Key key}) : super(key: key);

  @override
  _InputsWidgetState createState() => _InputsWidgetState();
}

class _InputsWidgetState extends State<InputsWidget> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '+60';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(55, 50, 40, 0),
            child: Text(
              'Log in to your account',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.fromLTRB(55, 0, 40, 15),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'Country Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Text(
                    'Phone No.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(55, 0, 40, 8),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF019D9A),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['+60', '+65']
                        .map<DropdownMenuItem<String>>(iterateMenuItem)
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                SizedBox(
                  width: 190,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (String value) {
                      if (value.length != 9) {
                        return 'Phone No. must be 9 digit';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter phone no.',
                      hintStyle: TextStyle(
                        fontFamily: 'Ubuntu',
                      ),
                      fillColor: Color(0xFF019D9A),
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(55, 50, 40, 0),
            child: ButtonTheme(
              minWidth: 350,
              height: 55,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondUI()),
                    );
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Color(0xFF01B9B4),
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DropdownMenuItem<String> iterateMenuItem(String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}
