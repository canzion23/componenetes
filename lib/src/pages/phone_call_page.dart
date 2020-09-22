import 'package:componentes/src/services/call_and_messages_service_.dart';
import 'package:componentes/src/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:url_launcher/url_launcher.dart';

class PhoneCallPage extends StatefulWidget {
  @override
  _PhoneCallPageState createState() => _PhoneCallPageState();
}

class _PhoneCallPageState extends State<PhoneCallPage> {
  String _number = '';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

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
            child: RaisedButton(
                onPressed: () => _service.call(_number),
                //launch(('tel://$_number')),
                child: Text("Call me")),
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
        counter: Text('Letras ${_number.length}'),
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
