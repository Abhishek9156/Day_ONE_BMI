import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var incontroller=TextEditingController();
  var result="";
  var col=Colors.black26;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

        ),
        body: Container(
            color: col,
            child:  Center(

                child:Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BMI",style: TextStyle(
                          fontSize: 30,fontWeight: FontWeight.bold
                      ),),
                      TextField(
                        controller: wtcontroller,
                        decoration: InputDecoration(
                            label: Text("Enter your weight (in kgs)"),
                            prefixIcon: Icon(Icons.monitor_weight)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller:incontroller ,
                        decoration: InputDecoration(
                            label: Text("Enter your height (in inch"),
                            prefixIcon: Icon(Icons.height_rounded)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: ftcontroller,
                        decoration: InputDecoration(
                            label: Text("Enter your age"),
                            prefixIcon: Icon(Icons.real_estate_agent)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(onPressed: (){
                        var wt=wtcontroller.text.toString();
                        var hi=incontroller.text.toString();
                        var age=ftcontroller.text.toString();
                        if(wt!="" && hi!= "" && age!=""){
                          var iwt=int.parse(wt);
                          var ihi=int.parse(hi);
                          var iage=int.parse(age);
                          var bmi=iwt/(ihi*iage);
                          if(bmi>25){
                            col=Colors.orange;
                          }else if(bmi<18){
                            col=Colors.red;
                          }else{
                            col=Colors.green;
                          }
                          setState(() {
                            result=("your BMi is: ${bmi.toStringAsFixed(2)}");
                          });
                        }else{
                          setState(() {
                            result="Fill all the fields";
                          });

                        }
                      }, child: Text("Calculate")),
                      SizedBox(height: 15,),
                      Text(result,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                    ],
                  ),
                )
            )
        )
    );
  }
}
