import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  var Weight_Controller = TextEditingController();

  var FtHeight_Controller = TextEditingController();

  var InHeight_Controller = TextEditingController();

  var Result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.black,
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



        body: Center(
          child: Container(
            // color: Colors.black,
            width: 300,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //If you want to add an image
              //   const Image(image: AssetImage('assets/images/img.png'),
              //       fit: BoxFit.fill),
              //
              //   const SizedBox(height: 40,),
              //   const Text('Enter details:', style: TextStyle(color: Colors.white)),
              // const SizedBox(height: 40,),


                TextField(
                  controller: Weight_Controller,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,filled: true,
                      prefixIcon: Icon(Icons.line_weight, size: 45,),
                      label: Text('Enter your weight(in kg)') ),
                  keyboardType: TextInputType.number,


                ),

                const SizedBox(height: 30,),

                TextField(
                  controller: FtHeight_Controller,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,filled: true,
                      prefixIcon: Icon(Icons.height, size: 45,),
                      label: Text('Enter your height (in Ft)') ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: InHeight_Controller,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,filled: true,
                      prefixIcon: Icon(Icons.height, size: 45,),
                      label: Text('Enter your height (Inch)') ),
                  keyboardType: TextInputType.number,
                ),

            const SizedBox(height: 30,),

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

                    setState(() {
                      Result = "Your BMI is: ${BMI.toStringAsFixed(2)}";
                    });
                  }
                  else{
                      setState((){
                        Result = "Please fill all the required blanks";
                      });
                  }

                },
                    child: Text("Calculate")),
                SizedBox(height: 30,),
                Text(Result, style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
