import 'package:flutter/material.dart';
import 'package:proone/groupratio.dart';
import 'package:proone/individual.dart';

class longSessionPage extends StatefulWidget {
  const longSessionPage({super.key});

  @override
  State<longSessionPage> createState() => _longSessionPageState();
}

class _longSessionPageState extends State<longSessionPage> {
  String _isIndividual = '';
  TimeOfDay? selectedTime;
  int minSalary = 0;
  int maxSalary = 0;

  void increaseMinSalary() {
    setState(() {
      minSalary = minSalary + 100;
    });
  }

  void decreaseMinSalary() {
    setState(() {
      if (minSalary > 0) {
        minSalary = minSalary - 100;
      }
    });
  }

  void increaseMaxSalary() {
    setState(() {
      maxSalary = maxSalary + 100;
    });
  }

  void decreaseMaxSalary() {
    setState(() {
      if (maxSalary > 0) {
        maxSalary = maxSalary - 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Request a Mentor',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        backgroundColor: const Color(0xff206F7E),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff206F7E)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('what do you prefer to be in?',
                  style: TextStyle(
                      color: Color(0xff206F7E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    'Individual',
                    style: TextStyle(color: Color(0xff206F7E), fontSize: 20),
                  ),
                  Radio(
                    value: 'Individual',
                    activeColor: Color(0xff206F7E),
                    groupValue: _isIndividual,
                    onChanged: (value) {
                      setState(() {
                        _isIndividual = value.toString();
                        if (_isIndividual == value.toString()) {
                          // Navigate to the OneTimeSessionPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => individualratio(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                  Text(
                    'Group',
                    style: TextStyle(color: Color(0xff206F7E), fontSize: 20),
                  ),
                  Radio(
                    value: 'Group',
                    activeColor: Color(0xff206F7E),
                    groupValue: _isIndividual,
                    onChanged: (value) {
                      setState(() {
                        _isIndividual = value.toString();
                        if (_isIndividual == value.toString()) {
                          // Navigate to the OneTimeSessionPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => groupratio(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
