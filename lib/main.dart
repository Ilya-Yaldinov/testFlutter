import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});


  Widget _passwordField(){
    return SizedBox(
                  width: 250.0,
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Введите пароль: ',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                  ),
                );
  }

  Widget _loginField(){
    return SizedBox(
                  width: 250.0,
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Введите логин: ',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                  ),
                );
  }

  Widget _submitButton(BuildContext context ,_formKey){
    return  SizedBox(
                    width: 100.0,
                    height: 25.0,
                    child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Войти'),
                      )
                    )
                  );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: new Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _loginField(),
                  SizedBox(height: 16),
                  _passwordField()
                ]
              )
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _submitButton(context, _formKey)
              ]
            )
          )
        ],
      )
    );
  }
}