import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Result.dart';
import 'main.dart';


class InputPage extends State<FitnessInput> {
  String selectedGender;
  int age;
  double height,weight;


final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
  return new Scaffold(
    body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
        children: <Widget>[
           ClipPath(
              child: Container(
                color: Colors.pink[400],
                height: 40,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            ClipPath(
              child: Container(
                color: Colors.pink[600],
                height: 40,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),
        

        
                      FormBuilder(
                // context,
                key: _fbKey,
                autovalidate: true,
                // readonly: true,
                 child: Column(
                  children: <Widget>[
                        new Container(
              margin: const EdgeInsets.only(top: 50)
            ),
                       FormBuilderDropdown(
                      attribute: "gender",
                      decoration: InputDecoration(
                        labelText: "Gender",
                        icon: const Icon(Icons.people),
                      ),
                      hint: Text('Select Gender'),
                      
                      validators: [FormBuilderValidators.required()],
                      items: ['Male', 'Female']
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text('$gender'),
                              )).toList(),
                    ),
                     FormBuilderTextField(
            attribute: "age",
            decoration: InputDecoration(
              icon: const Icon(Icons.tag_faces),
              hintText: "Age",
              ),
            validators: [
              FormBuilderValidators.numeric(),
              FormBuilderValidators.max(100),
            ],
  
          ),
           FormBuilderSlider(
                      attribute: "height",                
                      validators: [FormBuilderValidators.min(1)],
                      min: 0.0,
                      max: 3.0,
                      initialValue: 1.0,
                      divisions: 40,
                      decoration: InputDecoration(
              icon: const Icon(Icons.accessibility),
              labelText: "Height",
              ),
 
                    ),

             FormBuilderTextField(
            attribute: "weight",
            decoration: InputDecoration(
              icon: const Icon(Icons.opacity),
              hintText: "Weight",
              ),
            validators: [
              FormBuilderValidators.numeric(),
              FormBuilderValidators.max(600),
            ],
          ),

                     new Container(
              margin: const EdgeInsets.only(top: 40)
            ),
                    Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MaterialButton(
          child: Text("Calculate",style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
          onPressed: () {
            if (_fbKey.currentState.saveAndValidate()) {
               _fbKey.currentState.save();
                        if (_fbKey.currentState.validate()) {
                          selectedGender= _fbKey.currentState.value['gender'];
                          age = int.parse(_fbKey.currentState.value['age']);
                          height =_fbKey.currentState.value['height'];
                          weight =  double.parse(_fbKey.currentState.value['weight']);
                          Alert(context: context, title: "Your Result", desc: calculer(age,height,weight,selectedGender)).show();          
                          print(_fbKey.currentState.value);
                        } 
            }
          },
        ),
        MaterialButton(
          child: Text("Reset",style: TextStyle(color: Colors.white),),
                    color: Colors.pink,
          onPressed: () {
            _fbKey.currentState.reset();
          },
        ),
      ],
    )
                  ],
      ),
    ),






            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.pink[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.pink[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
        ],
    ),
      ),
    );
    }
}