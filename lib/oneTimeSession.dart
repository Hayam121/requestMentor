import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OneTimeSessionPage extends StatefulWidget {

  OneTimeSessionPage({super.key});

  @override
  State<OneTimeSessionPage> createState() => _OneTimeSessionPageState();
}

class _OneTimeSessionPageState extends State<OneTimeSessionPage> {
     String _selectedRatio = '';
   String _selectedReason = '';
   String _selectedMonth = '';
  String _selectedDay = '';
    DateTime? selectedDate;
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
                      border: Border.all(color:const Color(0xff206F7E)),
                      borderRadius: BorderRadius.circular(8.0),),
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const  Text('Why do you want a mentor?',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                          const SizedBox(width: 20),     
                         Row(
                    children: [
                      Radio(
                        value: 'Debug',
                         activeColor: const Color(0xff206F7E),
                        groupValue: _selectedRatio,
                        onChanged: (value) {
                          setState(() {
                            _selectedRatio = value.toString();
                          });
                        },
                      ),
                      const Text('Debug',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        ]),
                  Row(
                    children: [
                      Radio(
                        value: 'Code Review',
                        activeColor: const Color(0xff206F7E),
                        groupValue: _selectedRatio,
                        onChanged: (value) {
                          setState(() {
                            _selectedRatio = value.toString();
                          });
                        },
                      ),
                      const Text('Code Review',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        ]),
                      Row(
                        children: [
                          Radio(
                            value: 'Consultation',
                            groupValue: _selectedRatio,
                            activeColor: const Color(0xff206F7E),
                            onChanged: (value) {
                              setState(() {
                                _selectedRatio = value.toString();
                              });
                            },
                          ),
                          const Text('Consultation',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        ],
                      ),
                        ]),
          ),
////////////////////////////////////////////////////
               Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color:const Color(0xff206F7E)),
                      borderRadius: BorderRadius.circular(8.0),),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Date:',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                       ElevatedButton(
                       onPressed: () async {
                         final DateTime? pickedDate = await showDatePicker(
                           context: context,
                           initialDate: DateTime.now(),
                           firstDate: DateTime.now(),
                           lastDate: DateTime(DateTime.now().year + 1),
                         );
                         if (pickedDate != null) {
                           setState(() {
                             selectedDate = pickedDate;
                           });
                         }
                       },
                       style: ElevatedButton.styleFrom(
                                                        foregroundColor: Colors.white,
                                                         backgroundColor: Color(0xff206F7E), // Text color
                                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Button padding
                                                        textStyle: TextStyle(fontSize: 18), // Text style
                                                      ),
                       child: Text(selectedDate == null
                           ? 'Pick a Date'
                           : 'Date: ${selectedDate!.toString().split(' ')[0]}'),
                                             ),
                   ],
                 ),
               ),
               /////////////////////
                Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color:const Color(0xff206F7E)),
                      borderRadius: BorderRadius.circular(8.0),),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Time Avilability:',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
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
                      border: Border.all(color:const Color(0xff206F7E)),
                      borderRadius: BorderRadius.circular(8.0),),
                 child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('Min-Max Salary:',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                      Container(
                        child :  Row(
                            children: [                              
                              Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff206F7E)),
                  borderRadius: BorderRadius.circular(8.0),),
                                child: 
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_drop_up),
                                        iconSize:30,
                                        onPressed: increaseMinSalary,
                                      ),
                                      Text(
                                        'Min: $minSalary',
                                        style:TextStyle(fontSize: 16,)
                                        ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize:30,
                                        onPressed: decreaseMinSalary,
                                      ),
                                    ],
                                  ),
                                
                              ),
                              SizedBox(width: 15),
                               Container(
                         padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff206F7E)),
                  borderRadius: BorderRadius.circular(8.0),),
                        child :  Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_up),
                                        iconSize:30,
                                onPressed: increaseMaxSalary,
                              ),
                              Text(
                                'Max: $maxSalary',
                                style:TextStyle(fontSize: 16,)
                                ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                        iconSize:30,
                                onPressed: decreaseMaxSalary,
                              ),
                            ],
                          ),
                        
                      ),
                    ],
                  ),    
              ),    
          ])
           ),
            SizedBox(height: 20),
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
              
           ])
           );
           }
           }
 
        
    
            
    
   