import 'package:flutter/material.dart';
import '../molecules/gradient_text.dart';

class AddWeightPage extends StatelessWidget {
  final TextEditingController weight = TextEditingController();
  final TextEditingController day = TextEditingController();

  AddWeightPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: weight,
                decoration: const InputDecoration(
                  hintText: 'Введите текущий вес',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return value;
                },
              ),
            ),
            TextButton(
              child: GradientText(
                'Добавить вес',
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                gradient: LinearGradient(colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                ]),
              ),
              onPressed: () {
                if (weight.text.isNotEmpty) {
                  Navigator.pop(context);
                }
              },
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget> [
                    TextButton(
                      child: GradientText(
                        'Назад',
                        style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade300,
                          Colors.blue.shade400,
                        ]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
