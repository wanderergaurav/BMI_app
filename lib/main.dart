import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget{

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('yourBMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Calculate your Body Mass Index',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),

                SizedBox(height: 21,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (in kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You are OverWeight!!";
                      bgColor = Colors.orange.shade100;
                    }
                    else if(bmi<18){
                      msg = "You are UnderWeight!!";
                      bgColor = Colors.red.shade100;
                    }
                    else{
                      msg = "You are healthy!!";
                      bgColor = Colors.green.shade100;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";
                    });

                  }
                  else{
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }

                }, child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold),)),

                SizedBox(height: 12,),

                Text(result, style: TextStyle(fontSize: 16))
              ],
            ),
          ),
        ),
      )
    );
  }
}