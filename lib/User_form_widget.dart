import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hello/button_widget.dart';
import 'package:hello/user.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({Key? key, required this.onSavedUser}) : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {

  final formkey = GlobalKey<FormState>();
  late TextEditingController controllerDate;
  late TextEditingController controllerTrucknumber;
  late TextEditingController controllerWeight;
  late TextEditingController controllerShift;
  // late TextEditingController controllerName;
  // late TextEditingController controllerEmail;
  // late bool isBeginner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  void initUser() {
    // controllerName = TextEditingController();
    // controllerEmail = TextEditingController();
    // this.isBeginner = true;
  controllerDate = TextEditingController();
  controllerTrucknumber = TextEditingController();
  controllerWeight = TextEditingController();
  controllerShift = TextEditingController();

  }
  @override
  Widget build(BuildContext context) => Form(
    key: formkey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDate(),
        const SizedBox(height: 16,),
        buildTrucknumber(),
        const SizedBox(height: 16,),
        buildWeight(),
        const SizedBox(height: 16,),
        buildShift(),
        const SizedBox(height: 16,),
        buildSubmit(),
      ],
    ),
  );

  // Widget buildEmail() => TextFormField(
  //   controller: controllerEmail,
  //   decoration: InputDecoration(
  //     labelText: 'Email',
  //     border: OutlineInputBorder(),
  //   ),
  //   validator: (value) =>
  //   value != null && !value.contains('@') ? 'Enter Email' : null,
  // );

  Widget buildDate() => TextFormField(
    controller: controllerDate,
    decoration: InputDecoration(
      labelText: 'Date',
      border: OutlineInputBorder(
      ),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Date' : null,
  );

  Widget buildTrucknumber() => TextFormField(
    controller: controllerTrucknumber,
    decoration: InputDecoration(
      labelText: 'Trucknumber',
      border: OutlineInputBorder(
      ),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter TruckNumber' : null,
  );

  Widget buildWeight() => TextFormField(
    controller: controllerWeight,
    decoration: InputDecoration(
      labelText: 'Weight',
      border: OutlineInputBorder(
      ),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Weight' : null,
  );

  Widget buildShift() => TextFormField(
    controller: controllerShift,
    decoration: InputDecoration(
      labelText: 'Shift',
      border: OutlineInputBorder(
      ),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Shift' : null,
  );
  //
  // Widget buildName() => TextFormField(
  //   controller: controllerName,
  //   decoration: InputDecoration(
  //     labelText: 'Name',
  //     border: OutlineInputBorder(),
  //   ),
  //   validator: (value) =>
  //   value != null && value.isEmpty ? 'Enter Name' : null,
  // );

  // Widget buildFlutterBeginner() => SwitchListTile(title: Text('Is Flutter Beginner'),value: isBeginner, onChanged: (value) => setState(() {
  //   isBeginner = value;
  // }) );

  Widget buildSubmit() => ButtonWidget(text: 'Save', onClicked: () {
    final form = formkey.currentState!;
    final isValid = form.validate();
    if (isValid) {
      final user = User(
        date: controllerDate.text,
        trucknumber: controllerTrucknumber.text,
        weight: controllerWeight.text,
        shift: controllerShift.text,
        // name: controllerName.text,
        // email: controllerEmail.text,
        // isBeginner: isBeginner,
      );
      widget.onSavedUser(user);
    }
  });
}
