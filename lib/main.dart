import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var bgColor = Colors.indigo.shade100;
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Your BMI')),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [Color(0xffffecd2)])),
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in inch'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are Overweight";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are underweight";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "you are healthy";
                          bgColor = Colors.green.shade200;
                        }
                        result =
                            "$msg \nYour BMI is: ${bmi.toStringAsFixed(4)}";
                        setState(() {});
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks";
                        });
                      }
                    },
                    child: Text('Calculate')),
                Text(
                  result,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
