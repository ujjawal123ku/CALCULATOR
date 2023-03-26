import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstnum=0.0;
  double secondnum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideinput=false;
  var outputsize=34.0;
  onButtonclick(value){
  if (value=="AC"){
    input='';
    output='';



  }
  else if(value=="<"){
   if(input.isNotEmpty){
     input=input.substring(0,input.length-1);
   }
  }
  else if(value=="="){
   if(input.isNotEmpty) {
     var userinput = input;

     userinput = input.replaceAll("x", "*");
     Parser p = Parser();
     Expression expression = p.parse(userinput);
     ContextModel cm = ContextModel();
     var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
     output = finalvalue.toString();
     if (output.endsWith(".0")) {
       output = output.substring(0, output.length - 2);
     }
     input=output;
     hideinput=true;
     outputsize=52;
   }
  }
  else{
    input=input+value;
    hideinput=false;
    outputsize=34;
    }
  setState(() {

  });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(

        children: [
          //input output area
          Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black87,
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children:  [

                    Text(hideinput?"": input,style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: Colors.white),),
                     SizedBox(height: 20,),
                    Text(output,style: TextStyle(fontSize: outputsize,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 20,),
                  ],
                ),
              )
          ),



          //button area
          Row(
            children: [
              button(text: "AC",buttonbgcolor:operatorcolor,
              tcolor: orangecolor),
              button(text: "<",buttonbgcolor: operatorcolor,tcolor: orangecolor),
              button(text: "",buttonbgcolor: Colors.transparent),
              button(text: "/",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
            ],
          ),
          Row(
            children: [
              button(text: "7",buttonbgcolor: Colors.orangeAccent),
              button(text: "8"),
              button(text: "9",buttonbgcolor: Colors.transparent),
              button(text: "x",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
            ],
          ),
          Row(
            children: [
              button(text: "4",buttonbgcolor: Colors.orangeAccent),
              button(text: "5"),
              button(text: "6",buttonbgcolor: Colors.transparent),
              button(text: "-",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
            ],
          ),
          Row(
            children: [
              button(text: "1",buttonbgcolor: Colors.orangeAccent),
              button(text: "2"),
              button(text: "3",buttonbgcolor: Colors.transparent),
              button(text: "+",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
            ],
          ),
          Row(
            children: [
              button(text: "%",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
              button(text: "0"),
              button(text: ".",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor),
              button(text: "=",buttonbgcolor:operatorcolor,
                  tcolor: orangecolor,),
            ],
          ),











        ],
      )
    );// This trailing comma makes auto-formatting nicer for build methods
  }
  Widget button({
  text,tcolor=Colors.white,buttonbgcolor=buttoncolor,
}){
    return

    Expanded(
    child: Container(
    margin: EdgeInsets.all(8),
    child: ElevatedButton(


    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(22),
    primary: buttoncolor),
    onPressed: (){
      onButtonclick(text);

    },child: Text(text,style: TextStyle(fontSize: 18,color: tcolor,fontWeight: FontWeight.bold
    ),
    ),
    )
    ),
    );
  }
}
