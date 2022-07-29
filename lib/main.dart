import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_generator/paragraph/paragraph.data.dart';
import 'package:test_generator/question_single_choice/question_single_choice.data.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Generator(),
    );
  }
}

class Generator extends StatefulWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  bool mode = true;
  TextEditingController paragraphController = TextEditingController();
  List<TextEditingController> questionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int correctAnswer = -1;
  List template = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            File('output.json').writeAsString('{"content": ${template.map((e) => json.encode(e)).toList()}}');
          },
          child: const Text('Export', style: TextStyle(color: Colors.white),),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: ListView(
                children: template.map((e) => ListTile(
                  title: (e is ParagraphData) ? Text(e.data) : Text(e.question),
                )
                ).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  RadioListTile(
                    value: true,
                    groupValue: mode,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) mode = value;
                      });
                    },
                    title: const Text('question'),
                  ),
                  RadioListTile(
                    value: false,
                    groupValue: mode,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) mode = value;
                      });
                    },
                    title: const Text('paragraph'),
                  ),
                  !mode
                      ? Container(
                          padding: const EdgeInsets.all(20),
                          child: TextField(
                            controller: paragraphController,
                            decoration: const InputDecoration(
                              hintText: 'paragraph'
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextField(
                                controller: questionControllers[0],
                                decoration: const InputDecoration(
                                    hintText: 'question'
                                ),
                              ),
                              RadioListTile(
                                title: TextField(
                                  controller: questionControllers[1],
                                  decoration: const InputDecoration(
                                      hintText: 'answer 1'
                                  ),
                                ),
                                groupValue: correctAnswer,
                                onChanged: (int? value) {
                                  setState(() {
                                    if (value != null) correctAnswer = value;
                                  });
                                },
                                value: 0,
                              ),
                              RadioListTile(
                                title: TextField(
                                  controller: questionControllers[2],
                                  decoration: const InputDecoration(
                                      hintText: 'answer 2'
                                  ),
                                ),
                                groupValue: correctAnswer,
                                onChanged: (int? value) {
                                  setState(() {
                                    if (value != null) correctAnswer = value;
                                  });
                                },
                                value: 1,
                              ),
                              RadioListTile(
                                title: TextField(
                                  controller: questionControllers[3],
                                  decoration: const InputDecoration(
                                      hintText: 'answer 3'
                                  ),
                                ),
                                groupValue: correctAnswer,
                                onChanged: (int? value) {
                                  setState(() {
                                    if (value != null) correctAnswer = value;
                                  });
                                },
                                value: 2,
                              ),
                              RadioListTile(
                                title: TextField(
                                  controller: questionControllers[4],
                                  decoration: const InputDecoration(
                                      hintText: 'answer 4'
                                  ),
                                ),
                                groupValue: correctAnswer,
                                onChanged: (int? value) {
                                  setState(() {
                                    if (value != null) correctAnswer = value;
                                  });
                                },
                                value: 3,
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if (mode) {
              template.add(QuestionSingleChoiceData(
                  type: 'QuestionSingleChoice',
                  question: questionControllers[0].text,
                  answers: [
                    questionControllers[1].text,
                    questionControllers[2].text,
                    questionControllers[3].text,
                    questionControllers[4].text
                  ],
                  correctAnswer: correctAnswer
              ));
            } else {
              template.add(
                  ParagraphData(
                    type: 'Paragraph',
                    data: paragraphController.text,
                  )
              );
            }
          });
        },
        label: const Text('Save'),
      ),
    );
  }
}
