import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilelogin/bloc/login_bloc.dart';
import 'package:mobilelogin/data/user_repository.dart';

import 'package:mobilelogin/screens/secondUI.dart';

// Globals
final _formKey = GlobalKey<FormState>();

class FirstUI extends StatefulWidget {
  @override
  _FirstUIState createState() => _FirstUIState();
}

class _FirstUIState extends State<FirstUI> {
  bool autoValid = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginCountryCodeOnChanged) {
          return _DropdownButtonInput();
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return buildLoading();
        } else if (state is LoginSuccess) {
          print(state.user.phoneNumber);
        }

        return initialLayout(context);
      },
    );
  }

  Widget initialLayout(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                width: size.width * 1,
                height: size.height * 0.7,
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
                  child: _MyCustomForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
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

class _FormHeader extends StatelessWidget {
  const _FormHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      margin: EdgeInsets.only(top: 40),
      child: Text(
        'Log in to your account',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Ubuntu',
          fontSize: 25,
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  const _FormLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // form title
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Text(
              'Country Code',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
              ),
            ),
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
    );
  }
}

class _MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<_MyCustomForm> {
  final controller = TextEditingController();

  // UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      return controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _FormHeader(),
        _FormLabel(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: size.width * 0.25,
                height: size.height * 0.07,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF019D9A),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: _DropdownButtonInput(),
              ),
              Container(
                width: size.width * 0.53,
                height: size.height * 0.07,
                margin: EdgeInsets.only(left: 15),
                // padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                decoration: BoxDecoration(
                  color: Color(0xFF019D9A),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Container(
                  child: TextFormField(
                    controller: controller,
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
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.83,
          height: size.height * 0.08,
          margin: EdgeInsets.fromLTRB(30, 50, 0, 10),
          child:
              NextButton('+60', controller), // TODO: hard coded dropdown value.
        ),
        //         // Start Phone No. TextInput Field
        //         Container(
        //           width: 190,
        //           child: TextFormField(
        //             keyboardType: TextInputType.phone,
        //             validator: (String value) {
        //               if (value.length != 9) {
        //                 return 'Phone No. must be 9 digit';
        //               } else {
        //                 return null;
        //               }
        //             },
        //             decoration: InputDecoration(
        //               hintText: 'Enter phone no.',
        //               hintStyle: TextStyle(
        //                 fontFamily: 'Ubuntu',
        //               ),
        //               fillColor: Color(0xFF019D9A),
        //               filled: true,
        //               contentPadding: EdgeInsets.only(left: 15),
        //               border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(40),
        //               ),
        //             ),
        //           ),
        //         ),
        //         // End Phone No. TextInput Field
        //       ],
        //     ),
        //   ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _DropdownButtonInput extends StatefulWidget {
  // final String dropdownValue;

  // _DropdownButtonInput({this.dropdownValue});

  @override
  _DropdownButtonInputState createState() => _DropdownButtonInputState();
}

class _DropdownButtonInputState extends State<_DropdownButtonInput> {
  final UserRepository _userRepository = UserRepository();

  String dropdownValue = UserRepository.defaultValue();
  String countryCode = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: dropdownValue,
      items: _userRepository.getCountryCodes().map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String value) {
        dropdownValue = value;
        print(dropdownValue);
        context.bloc<LoginBloc>().add(GetUserCountryCode(dropdownValue));
      },
    );
  }
}

class NextButton extends StatelessWidget {
  // const NextButton({Key key}) : super(key: key);

  final String countryCode;
  final TextEditingController controller;

  const NextButton(this.countryCode, this.controller);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          context.bloc<LoginBloc>().add(GetUser(countryCode, controller.text));

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
