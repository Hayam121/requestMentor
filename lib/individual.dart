import 'package:flutter/material.dart';
import 'package:proone/groupratio.dart';
import 'package:proone/oneTimeSession.dart';

class individualratio extends StatefulWidget {
  const individualratio({super.key});

  @override
  State<individualratio> createState() => _individualratioState();
}

class _individualratioState extends State<individualratio> {
  String _isOnetoOne='';
  String _isIndividual='';
  TimeOfDay? selectedTime;
  TimeOfDay? selectedTimeto;
  int minSalary = 0;
  int maxSalary = 0;

  void increaseMinSalary() {
    setState(() {
        minSalary=minSalary+100;
    });
  }

  void decreaseMinSalary() {
    setState(() {
      if (minSalary > 0) {
        minSalary=minSalary-100;
      }
    });
  }

  void increaseMaxSalary() {
    setState(() {
        maxSalary=maxSalary+100;
    });
  }

  void decreaseMaxSalary() {
    setState(() {
      if (maxSalary > 0) {
        maxSalary=maxSalary-100;
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
        title: const Text('Request a Mentor',style: TextStyle(color: Colors.white,fontSize: 35),),
        backgroundColor: const Color(0xff206F7E),
      ),
      body: Column(
        children: [
          Container(      
             padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),        
                    decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff206F7E)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text('what do you prefer to be in?',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),     
                    Row(
                      children: [
                        Text('Individual',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        Radio(
                          value: 'Individual',
                           activeColor: Color(0xff206F7E),
                          groupValue: _isIndividual,
                          onChanged: (value) {
                            setState(() {
                              _isIndividual = value.toString();
                            });
                          },
                        ),
                        Text('Group',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        Radio(
                          value: 'Group',
                          activeColor: Color(0xff206F7E),
                          groupValue: _isIndividual,
                          onChanged: (value) {
                            setState(() {
                              _isIndividual = value.toString();
                               if (_isIndividual == value.toString()) {
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
                  ]),),
                  Container(
                     padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),        
                    decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff206F7E)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                    child: Column(
                      children: [
                        const  Text('what do you prefer to be in?',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),     
                          Row(
                            children: [
                              Text('One to One',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                              Radio(
                                value: 'One to One',
                                 activeColor: Color(0xff206F7E),
                                groupValue: _isOnetoOne,
                                onChanged: (value) {
                                  setState(() {
                                    _isOnetoOne = value.toString();
                                     
                                  });
                                },
                              ),
                              Text('Training Group',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                              Radio(
                                value: 'Training Group',
                                activeColor: Color(0xff206F7E),
                                groupValue: _isOnetoOne,
                                onChanged: (value) {
                                  setState(() {
                                    _isOnetoOne = value.toString();
                                      });
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ), 
         if (_isOnetoOne.isNotEmpty) // Show additional fields only if One to One or Training Group is selected
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff206F7E)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Time Availability:',
                        style: TextStyle(color: Color(0xff206F7E), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                         Row(
                         children: [
                           Container(
                             child: ElevatedButton(
                                               onPressed: () async {
                                                 final TimeOfDay? pickedTime = await showTimePicker(
                                                   context: context,
                                                   initialTime: TimeOfDay.now(),
                                                 );
                                                 if (pickedTime != null) {
                                                   setState(() {
                                                     selectedTime = pickedTime;
                                                   });
                                                 }
                                               },
                                                style: ElevatedButton.styleFrom(
                                                        foregroundColor: Colors.white,
                                                         backgroundColor: Color(0xff206F7E), // Text color
                                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Button padding
                                                        textStyle: TextStyle(fontSize: 18), // Text style
                                                      ),
                                               child: Text(selectedTime == null
                                                   ? 'From'
                                                   : 'Time: ${selectedTime!.format(context)}'),
                                             ),
                           ), 
                               SizedBox(width: 20), // Add space between containers
                               Container(
                             child: ElevatedButton(
                                           child: Text(
                                                selectedTimeto == null
                                                   ? 'To'
                                                   : 'Time: ${selectedTimeto!.format(context)}',
                                                   ),
                                                   style: ElevatedButton.styleFrom(
                                                        foregroundColor: Colors.white,
                                                         backgroundColor: Color(0xff206F7E), // Text color
                                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), // Button padding
                                                        textStyle: TextStyle(fontSize: 18), // Text style
                                                    ),
                                               onPressed: () async {
                                                 final TimeOfDay? pickedTime = await showTimePicker(
                                                   context: context,
                                                   initialTime: TimeOfDay.now(),
                                                 );
                                                 if (pickedTime != null) {
                                                   setState(() {
                                                     selectedTimeto = pickedTime;
                                                   });
                                                 }
                                               },
                                               
                                             ),
                           ),     
                         ],
                       ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff206F7E)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Min-Max Salary:',
                        style: TextStyle(color: Color(0xff206F7E), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff206F7E)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_drop_up),
                                    iconSize: 30,
                                    onPressed: increaseMinSalary,
                                  ),
                                  Text(
                                    'Min: $minSalary',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    onPressed: decreaseMinSalary,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff206F7E)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_drop_up),
                                    iconSize: 30,
                                    onPressed: increaseMaxSalary,
                                  ),
                                  Text(
                                    'Max: $maxSalary',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    onPressed: decreaseMaxSalary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text('Apply'),
                onPressed: () {
                  // Handle form submission here
                  // You can access the form values like track, description, selectedGenderRatio, selectedDate, selectedTime, minSalary, and maxSalary
                }, 
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                   backgroundColor: Color(0xff206F7E),
                   // Text color
                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold)),
                ),
              ],
            ),
        ],
      ),
    );
  }
}                            