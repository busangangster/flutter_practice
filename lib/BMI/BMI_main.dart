import 'package:flutter/material.dart';

import 'BMI_result.dart';

class BmiMain extends StatefulWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI Test")),
        body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '키',
                      ),
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '키를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '몸무게',
                      ),
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '몸무게를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BmiResult(
                                        double.parse(
                                            _heightController.text.trim()),
                                        double.parse(
                                            _weightController.text.trim()))),
                              );
                            }
                          },
                          child: Text("결과"),
                        ))
                  ],
                ))));
  }
}
