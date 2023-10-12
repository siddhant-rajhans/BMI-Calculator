import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/Splash Screen.dart';
import 'image_view_screen.dart';

void main() {
  runApp( const MaterialApp(home: SpLash(), debugShowCheckedModeBanner: false,));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => HomeApp();
}




class HomeApp extends State<MainApp> {
  var Weight_Controller = TextEditingController();

  var FtHeight_Controller = TextEditingController();

  var InHeight_Controller = TextEditingController();

  var Result = "";

  var bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(Icons.monitor_weight, size: 42,), // Centered logo
              SizedBox(width: 8), // Add spacing between logo and title
              Text('BMI Calculator', style: TextStyle(
                fontSize: 24, // Increased font size for title text
                fontWeight: FontWeight.w900
              )), // Centered title text
            ],
          ),
        ),



        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              // color: Colors.black,
              width: 300,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //If you want to add an image
                    // const Image(image: AssetImage('assets/images/img.png'),
                    //     fit: BoxFit.fill),

                    const SizedBox(height: 40,),
                    const Text('Enter details:', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 40,),


                    TextField(
                      controller: Weight_Controller,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,filled: true,
                          prefixIcon: Icon(Icons.line_weight, size: 45,),
                          label: Text('Enter your weight( kg )') ),
                      keyboardType: TextInputType.number,


                    ),

                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: SizedBox(
                        //height: 40,
                      width: double.infinity,
                      // child: Text('eg: 5 ft 10 inch. \n\n      if you are 6ft, then enter 0 inch. ', style: TextStyle(color: Colors.white),),
                      ),
                    ),

                    TextField(
                      controller: FtHeight_Controller,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,filled: true,
                          prefixIcon: Icon(Icons.height, size: 45,),
                          label: Text(' Feet (e.g., 5)') ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 30),

                    TextField(
                      controller: InHeight_Controller,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,filled: true,
                          prefixIcon: Icon(Icons.height, size: 45,),
                          label: Text('Inches (e.g., 11)') ),
                      keyboardType: TextInputType.number,
                    ),

                const SizedBox(height: 30,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){

                          var weight = Weight_Controller.text.toString();
                          var feet = FtHeight_Controller.text.toString();
                          var inch = InHeight_Controller.text.toString();

                          if(weight!= "" && feet != ""){
                          //BMI Calculation
                            var intWeight =int.parse(weight);
                            var intInch = int.parse(inch);
                            var intFeet = int.parse(feet);

                            var totalInches = (intFeet * 12) + intInch ;
                            var totalCetimeter = totalInches * 2.54 ;
                            var totalMeter = totalCetimeter/100 ;

                            var BMI = intWeight/(totalMeter * totalMeter);

                            var message = "";

                            if(BMI > 25){
                                message = "You're overweight!";
                              bgColor = Colors.red;
                            }
                            else if(BMI<18){
                              message = "You're underweight!";
                              bgColor = Colors.red.shade200;
                            }
                            else {
                              message = "You're Healthy!!";
                              bgColor = Colors.green;
                            }




                            setState(() {
                              Result = "$message \n Your BMI is: ${BMI.toStringAsFixed(2)}";
                            });
                          }
                          else{
                              setState((){
                                Result = "Please fill all the required blanks";
                              });
                          }

                        },
                            child: Text("Calculate")),

                        SizedBox(width: 10,),


                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ImageViewScreen('assets/images/img.png')), // Replace with your image path
                            );
                          },
                          child: Text('See BMI chart'),
                        ),






                        // ElevatedButton(onPressed: (){
                        //   Image.asset('assets/images/img.png');
                        // }, child: Text('See BMI chart'))





                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(Result, style: TextStyle(color: Colors.white),),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
