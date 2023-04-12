import 'package:auto_binding_field/auto_binding_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoBindingField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AutoBindingField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String mobile = '';
  String email = '';
  int? age = 18;
  double? salary;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Personal Info',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AutoBindingTextField(
                  value: name,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                AutoBindingTextField.mobile(
                  value: mobile,
                  onChanged: (value) {
                    setState(() {
                      mobile = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Mobile'),
                ),
                AutoBindingTextField.email(
                  value: email,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                AutoBindingNumField(
                  value: age,
                  type: NumberType.onlyPositiveInt,
                  onChanged: (value) {
                    setState(() {
                      age = value as int?;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                AutoBindingNumField(
                  value: salary,
                  type: NumberType.onlyPositiveDecimal,
                  onChanged: (value) {
                    setState(() {
                      salary = value as double?;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Salary'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                TextSpan(text: 'Name: $name\n'),
                TextSpan(text: 'Mobile: $mobile\n'),
                TextSpan(text: 'Email: $email\n'),
                TextSpan(text: 'age: $age\n'),
                TextSpan(text: 'salary: $salary\n'),
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    name = '';
                    mobile = '';
                    email = '';
                    age = null;
                    salary = null;
                    setState(() {});
                  },
                  child: const Text('clear form')),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text('validate')),
            ],
          ),
        ],
      ),
    );
  }
}
