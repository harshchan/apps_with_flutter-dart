//material is alreadys added into dart
//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appp/samples/question_source.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
  List questionBank=[
    Questions.name("The earth is the fourth planet from the sun", true),
    Questions.name("The planet Venus has no moons.", false),
    Questions.name("Jupiter is composed mostly of iron", true),
    Questions.name("The sun is a star of average size.",true),

  ];
  @override
  Widget build(BuildContext context) {

    _checkAnswer(bool userChoice, BuildContext context){
      if(userChoice==questionBank[_currentQuestionIndex].isCorrect)
        {
          final snackbar=SnackBar(
              duration:Duration(milliseconds:500),
              backgroundColor: Colors.greenAccent,
              content: Text("Correct!"));
          Scaffold.of(context).showSnackBar(snackbar);
          debugPrint("Yes Correct ! ");
        }
      else{
        final snackbar=SnackBar(
            duration:Duration(milliseconds:500),
            backgroundColor: Colors.redAccent,
            content: Text("Incorrect!"));
        Scaffold.of(context).showSnackBar(snackbar);
        debugPrint("incorrect ! ");
      }

    }
    _nextQuestion()
    {setState(() {
      _currentQuestionIndex=(_currentQuestionIndex+1)%questionBank.length;
    });

    }
    return Scaffold(
      appBar:AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
          backgroundColor: Colors.blueGrey,

      ),
          backgroundColor: Colors.amber.shade200,
      body:Builder(
        builder:(BuildContext context)=> Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Center(child: Image.asset("images/signbas.jpg",height: 100,width: 200,)
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    decoration: BoxDecoration(


                      color:Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border:Border.all(
                        color:Colors.deepPurple,style:BorderStyle.solid
                      )
                    ),
                    height:120.0,width:400.0,
                    child:Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(questionBank[_currentQuestionIndex].questionText,style:TextStyle(
                        color:Colors.deepPurple,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,

                      )),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(onPressed: ()=>_checkAnswer(true,context),color:Colors.blueGrey,
                    child:Text("True"),
                    ),
                    RaisedButton(onPressed: ()=>_checkAnswer(false,context),color:Colors.blueGrey,
                      child:Text("False"),),
                    RaisedButton(onPressed: ()=>_nextQuestion(),color:Colors.blueGrey,
                      child:Icon(Icons.forward),)

                  ],
                ),
                Spacer(),
              ]
            )

          ),
        ),
      )
    );


  }
}



//put BillSplitter() in main.dart to invoke the Bill splitter app
class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage=0;
  int _personCounter=1;
  double _billAmount=0.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),

        alignment: Alignment.center,
        color:Colors.white,
        child:ListView(
          scrollDirection:Axis.vertical,
          padding:EdgeInsets.all(20.5),
          children:<Widget>[
            Container(
              width:150,height:150,
              decoration:BoxDecoration(
                color:Colors.purple.shade100,
                borderRadius: BorderRadius.circular(12.5)

              ),
                child:Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Total per Person",style:TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17.00,
                color:Colors.purple,


              )),
            ),
            Text(" \$ ${calcTotalPerPerson(_billAmount,_personCounter,_tipPercentage)}",style:TextStyle(
            fontWeight: FontWeight.bold,
                fontSize: 30.00,
                color:Colors.purple,),)
           ],
        ),
                )
            ),
            Container(
              margin:EdgeInsets.only(top:20.0),
              padding:EdgeInsets.all(12.0),
              decoration:BoxDecoration
                (color:Colors.transparent,
              border:Border.all(
                color:Colors.purple,
              ),
              borderRadius: BorderRadius.circular(20.0) ,
              ),
              child:Column(
                children:<Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal:true),
                    style:TextStyle(color:Colors.grey),
                    decoration:InputDecoration(
                      prefixText:"Bill Amount",
                      prefixIcon: Icon(Icons.money_rounded),

                    ),
                      onChanged:(String value)
          {
            try{
              _billAmount=double.parse(value);



          }catch(exception){
              _billAmount=0.00;
            }
          }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Text("Split",style:TextStyle(
                        color:Colors.grey,
                      ),),
                      Row(
                        children:<Widget>[
                          InkWell(
                            onTap:(){
                              setState(() {
                                if(_personCounter>1){
                                  _personCounter--;
                                }

                              });
                            },
                            child:Container(
                              width:40,height:40,
                              margin: EdgeInsets.all(10.0),
                              decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(20.0),
                                color:Colors.purple.shade50,
                            ),
                              child:Center(
                                child: Text("-",style:TextStyle(
                                  color:Colors.red,

                                  fontWeight:FontWeight.bold,
                                  fontSize:17.0,
                                )

                                ),
                              )
                            )
                          ),
                          Text("$_personCounter",style:TextStyle(
                            color: Colors.purple.shade100,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          )),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child:Container(
                                width:40,height:40,
                                margin: EdgeInsets.all(10.0),
                                decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(20.0),
                                  color:Colors.purple.shade50,
                                ),
                                child:Center(
                                  child: Text("+",style:TextStyle(
                                    color:Colors.red,

                                    fontWeight:FontWeight.bold,
                                    fontSize:17.0,
                                  )

                                  ),
                                )

                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        Text("Tip",
                          style:TextStyle(
                              color:Colors.grey.shade700
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("\$ ${calcTotalTip(_billAmount, _personCounter,_tipPercentage)}",style:TextStyle(
                            color:Colors.purple.shade700,
                            fontSize:20.0,
                            fontStyle: FontStyle.italic,
                          )),
                        )
                      ]
                  ),
                  //slider
                  Column(
                    children:<Widget>[
                      Text("$_tipPercentage%",style:TextStyle(
                        color:Colors.purple.shade500,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,

                      )),
                      Slider(
                          min:0,max:100,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.grey,
                           divisions:10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value){
                        setState(() {
                          _tipPercentage=value.round();
                        });
                          })
                    ]
                  )

                ],
              )
            )
          ]

        )
      )
    );
  }
  calcTotalPerPerson(double billAmount,int splitBy,int tipPercentage)
  {
var totalPerPer=(calcTotalTip(billAmount, splitBy, tipPercentage)+billAmount)/splitBy;
return totalPerPer.toStringAsFixed(2);

  }
  calcTotalTip(double billAmount,int SplitBy,int tipPercentage)
  {
    double totalTip=0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null)
      {}
    else{
      totalTip=(billAmount*tipPercentage)/100;
    }
return totalTip;
  }
}

//put Wisdom() in main.dart to invoke Wisdom app which will randomly generate any quote
class Wisdom extends StatefulWidget {
  //List quotess=["hello","hola","hi","i ","am","harsh"];
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int i=1;
  List quotes=["hello","hola","hi","i ","am","harsh"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Container(
              width:350,height:200,
              margin:EdgeInsets.all(30.0),
              child: Center(child: Text(quotes[i%quotes.length])),

            decoration:BoxDecoration(
                color:Colors.redAccent,
              borderRadius: BorderRadius.circular(14.0)
              )),
            Divider(thickness:1.5),
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: FlatButton.icon(
                  onPressed:_showQuote,
                  color:Colors.greenAccent,
                  icon:Icon(Icons.account_tree), label: Text("inspirataion",style:TextStyle(
                fontSize: 18.6,
                color:Colors.white

              ))),
            )
          ]
        )
      )
    );
  }

  void _showQuote() {


  }
}

//put BizCard() in main.dart to see a Business card inn main.dartt
class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BizCard"),
        //centerTitle: Center.True,
      ),
      backgroundColor: Colors.deepPurple,
      body:Container(
        alignment:Alignment.center,
        child:Stack(
          alignment:Alignment.topCenter,
          children:<Widget>[
           _getCard(),
            _getAvatar(),

          ]
        )
      )
    //backgroundColor: Colors.deepPurple
    );
  }
}
Container _getCard() {
  return Container(
      width: 350, height: 200,
      margin:EdgeInsets.all(50),
      decoration: BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(25)

  ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello",
            style:TextStyle(fontSize:20,
            fontWeight:FontWeight.w300,
            color:Colors.white),),
            Text("Harsh Chandekar"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.tag_faces),
                Text("F :@harshchan")
              ],
            )
          ]
      )
  );
}
  Container _getAvatar() {
    return Container(
      width:100,height:100,
      decoration:BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.all(Radius.circular(50.0)),
        border:Border.all(color:Colors.redAccent,width:1.2),
        image:DecorationImage(image:NetworkImage("https://picsum.photos/200/300"),
        //fit:
        )
      )
    ) ;
  }


class ScaffoldExample extends StatelessWidget {
  _tapbutton() {
    debugPrint("tapped Button");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade50,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email),
              onPressed: () => debugPrint("email tapped")),
          IconButton(icon: Icon(Icons.alarm), onPressed: _tapbutton)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child:Icon(Icons.fast_rewind),
        onPressed: ()=>debugPrint("Hello world")
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_on), title: Text("first")),
      BottomNavigationBarItem(
            icon: Icon(Icons.tram_rounded),title : Text("second"))
      ]),
      backgroundColor: Colors.greenAccent,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CustomButton()
              // InkWell(
              //   child:Text("Tap me",style:TextStyle(fontSize:23.5),),
              //     onTap: ()=>debugPrint("tapped.."),
              // )

            ],
          )
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("hello wapas se"),);

        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8.0)

        ),
        child: Text("button"),
      ),
    );
  }
}


//just type st
//it creates a new stateless widget then just write class name in it
// replacing name of class with scaffolsexample
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child:Text("Hello flutter!",textDirection: TextDirection.ltr),);
    return Material(
        color: Colors.pink,
        child: Center(
            child: Text(
              "hello Flutter",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.5,
                  fontStyle: FontStyle.italic),
            )));
  }
}

//stateless widget they dont have a satate ex hello world or button
// no widget withdrawing
// stateful wizard
// for ex enter name or create slider ie to unlock slide
// slider left or right
//     stores state in state objeect
//     then setstate function changes the ui
