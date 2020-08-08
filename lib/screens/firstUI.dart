import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilelogin/bloc/authentication/AuthenticationBloc.dart';
import 'package:mobilelogin/bloc/authentication/AuthenticationState.dart';
import 'package:mobilelogin/screens/secondUI.dart';

class FirstUI extends StatefulWidget {
  @override
  _FirstUIState createState() => _FirstUIState();
}

final _formKey = GlobalKey<FormState>();

class _FirstUIState extends State<FirstUI> {
  String dropdownValue = '+60';
  bool autoValid = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Background Image
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/03.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleLayout(),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Color(0xFF01B9B4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  autovalidate: autoValid,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
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
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                        child: Row(
                          children: <Widget>[
                            // Start Country Code
                            Container(
                              child: Text(
                                'Country Code',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            // End Country Code
                            SizedBox(
                              width: 30,
                            ),
                            // Start Phone No.
                            Container(
                              child: Text(
                                'Phone No.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                            // Start Phone No.
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                        child: Row(
                          children: <Widget>[
                            // Start Country Code DropDown Button
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
                                    .map<DropdownMenuItem<String>>(
                                        iterateMenuItem)
                                    .toList(),
                              ),
                            ),
                            // End Country Code DropDown Button
                            SizedBox(
                              width: 17,
                            ),
                            // Start Phone No. TextInput Field
                            Container(
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
                            // Start Phone No. TextInput Field
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(55, 50, 40, 0),
                        child: ButtonTheme(
                          minWidth: 350,
                          height: 55,
                          child: NextButton(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
    );
  }
}

DropdownMenuItem<String> iterateMenuItem(String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}

class TitleLayout extends StatelessWidget {
  const TitleLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
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
            ],
          ),
        ),
      ),
    );
  }
}
