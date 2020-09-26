import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeACall extends StatefulWidget {
  @override
  _MakeACallState createState() => _MakeACallState();
}

class _MakeACallState extends State<MakeACall> {
  String _number = '';

  Future<void> _makePhoneCall(String contact, bool direct) async {
    if (direct == true) {
      bool res = await FlutterPhoneDirectCaller.callNumber(contact);
      print(res);
    } else {
      String telScheme = 'tel:$contact';

      if (await canLaunch(telScheme)) {
        await launch(telScheme);
      } else {
        throw 'Could not launch $telScheme';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call Me"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.phone),
                RaisedButton(
                  child: Text("Test Call"),
                  onPressed: () => _makePhoneCall(_number, true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Digitos ${_number.length}'),
        hintText: 'Número a marcar',
        labelText: 'Número',
        suffixIcon: Icon(Icons.phone_android),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _number = value;
        });
      },
    );
  }
}
