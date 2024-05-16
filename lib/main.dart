import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var c3 = TextEditingController();
  var bmi = '';
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  controller: c1,
                  decoration: const InputDecoration(
                    labelText: 'Enter your weight (in kgs)',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: c2,
                  decoration: const InputDecoration(
                    labelText: 'Enter your height (in feet)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: c3,
                  decoration: const InputDecoration(
                    labelText: 'Enter your height (in inches)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = int.tryParse(c1.text);
                    var feet = int.tryParse(c2.text);
                    var inches = int.tryParse(c3.text);

                    if (weight != null && feet != null && inches != null) {
                      setState(() {
                        double heightInMeters = (feet * 12 + inches) * 0.0254;
                        double bmiValue =
                            weight / (heightInMeters * heightInMeters);
                        var msg = '';
                        if (bmiValue > 25) {
                          msg = "You're overweight!";
                          bgColor = Colors.red;
                        } else if (bmiValue < 18) {
                          msg = "You're underweight!";
                          bgColor = Colors.grey;
                        } else {
                          msg = "You're healthy!";
                          bgColor = Colors.green;
                        }
                        bmi = '$msg\nYour BMI is: ${bmiValue.toStringAsFixed(2)}';
                      });
                    } else {
                      setState(() {
                        bmi = 'Please fill all the required blanks';
                      });
                    }
                  },
                  child: const Text('Calculate BMI'),
                ),
                Text(
                  bmi,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
