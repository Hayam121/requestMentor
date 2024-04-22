import 'package:flutter/material.dart';
import 'package:proone/longSeesion.dart';
import 'package:proone/oneTimeSession.dart';

class MentorRequestPage extends StatefulWidget {
  const MentorRequestPage({super.key});

  @override
  _MentorRequestPageState createState() => _MentorRequestPageState();
}

class _MentorRequestPageState extends State<MentorRequestPage> {
  String selectedGenderRatio = '';
  String _selectedGender = 'Male';
  String _selectedlanguage ='Arabic';
// bool _isOneTimeSession = true; 
String _isOneTimeSession = ''; 

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ),
        title: const Text('Request a Mentor',style: TextStyle(color: Colors.white,fontSize: 35),),
        backgroundColor: Color(0xff206F7E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Text('Track',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              TextFormField(
                decoration: const InputDecoration(
                  // labelText: 'Track',
                  enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff206F7E)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),)
                  ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a track';
                  }
                  return null;
                },
                onSaved: (value) {
                },
              ),
              const SizedBox(height: 16),
            const  Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              TextFormField(
                decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Color(0xff206F7E)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),)
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                },
              ),
          SizedBox(height: 16,),
          
            const  Text( 'Preferred Language',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             DropdownButtonFormField<String>(
                value: _selectedlanguage,
                onChanged: (newValue) {
                  setState(() {
                    _selectedlanguage = newValue!;
                  });
                },               
                items: ['Arabic', 'English','spanish','hayam']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                   labelStyle: TextStyle(fontSize: 25),
                   enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Color(0xff206F7E)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),)                  
                  ),
                  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a language';
                  }
                  return null;
                },
                onSaved: (value) {
                  _selectedlanguage = value!;
                },
              ),
              ///////////////
              SizedBox(height: 16,),
            const  Text( 'Preferred Gender Mentor',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),             
             DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },  
                              
                items: ['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                   enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Color(0xff206F7E)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),)                  
                  ),
                  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
                onSaved: (value) {
                  _selectedGender = value!;
                },
              ),
              const SizedBox(height: 16),
                           
             Container(      
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff206F7E)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text('Type of MentorShip',style: TextStyle(color:Color(0xff206F7E),fontSize: 20,fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),     
                    Row(
                      children: [
                        Text('One Time Session',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        Radio(
                          value: 'One Time Session',
                           activeColor: Color(0xff206F7E),
                          groupValue: _isOneTimeSession,
                          onChanged: (value) {
                            setState(() {
                              _isOneTimeSession = value.toString();
                               if (_isOneTimeSession==value.toString()) {
                                // Navigate to the OneTimeSessionPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OneTimeSessionPage(),
                                  ),
                                );
                              }
                            });
                          },
                        ),
                        Text('Long Term',style: TextStyle(color:Color(0xff206F7E),fontSize: 20),),
                        Radio(
                          value: 'Long Term',
                          activeColor: Color(0xff206F7E),
                          groupValue: _isOneTimeSession,
                          onChanged: (value) {
                            setState(() {
                              _isOneTimeSession = value.toString();
                                if (_isOneTimeSession==value.toString()) {
                                // Navigate to the OneTimeSessionPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => longSessionPage(),
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
            ],
          ),
        ),
      ),
    );
  }
}