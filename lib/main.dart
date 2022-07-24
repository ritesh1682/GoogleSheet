import 'package:flutter/material.dart';
import 'package:hello/user.dart';
import 'package:hello/users_sheet.dart';

import 'User_form_widget.dart';
import 'button_widget.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetApi.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Users",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CreateSheetPage(),

    );
  }
}

class CreateSheetPage extends StatelessWidget {
  const CreateSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sheet APP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: UserFormWidget(onSavedUser: (user) async{
            await UserSheetApi.insert([(user.toJson())]);
          },),
        ),
      ),
    );
  }
  Future insertUsers() async{

  }
}

