
import 'dart:async';
import 'dart:math';
import 'package:fastfinger/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class fastFinger extends StatefulWidget {
  const fastFinger({Key? key}) : super(key: key);

  @override
  State<fastFinger> createState() => _fastFingerState();
}
var kelimeler =<String>[
  "the","be", "to", "of", "and", "a", "in", "that", "have", "I", "it", "for", "not", "on", "with", "he", "as", "you", "do", "at", "this", "but", "his", "by", "from", "they", "we", "say", "her", "she", "or", "an", "will", "my", "one", "all", "would", "there", "their", "what", "so", "up", "out", "if", "about", "who", "get", "which", "go", "me", "when", "make", "can", "like", "time", "no", "just", "him", "know", "take", "people", "into", "year", "your", "good", "some", "could", "them", "see", "other", "than", "then", "now", "look", "only", "come", "its", "over", "think", "also", "back", "after", "use", "two", "how", "our", "work", "first", "well", "way", "even", "new", "want", "because", "any", "these", "give", "day", "most", "us"
];
var rnd=Random();
var rndWords=[];
var allWords="";
var textControl=TextEditingController();
bool isVisible=true;
int keyStroke=0;
int wpm=0;
int trueResult=0;
int falseResult=0;
int touched=0;
int currentIndex=0;
Color falseColor=Colors.redAccent;
Color trueColor=Colors.green;
Color emptyColor=Colors.grey;

class _fastFingerState extends State<fastFinger> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);

  @override
  void initState() {
    for (int i = 0; i < kelimeler.length; i++) {
      rndWords.add(kelimeler[rnd.nextInt(kelimeler.length)]);
    }
    for (var i in rndWords) {
      allWords += i + " ";
    }
    super.initState();
  }
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });}


    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text("Fast Finger Game"),
        ),
        body: Center(
          child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 1050,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)),
                        border: Border.all(color: Colors.blue, width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children:<InlineSpan>[
                            for(var word in rndWords)
                              TextSpan(text: word + " ",style: TextStyle(fontSize: 30,),
                              ),

      ],
                        ),

                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
                Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 1050,
                        height: 50,
                        color: Colors.grey[300],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: 525,
                            color: Colors.white,
                            child: TextField(
                              onTap: (){
                                setState(() {
                                  touched++;
                                });
                                if(touched==1)startTimer();
                              },
                              onChanged: (result){
                                print(result);
                                while(myDuration.inSeconds==0){

                                  if(myDuration.inSeconds==0){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => resultPage(true_result: trueResult, false_result: falseResult, WPM: wpm, key_stroke: keyStroke)));
                                  }
                                  if(textControl.text.isEmpty){
                                    setState(() {
                                          //En son result dan alınan verileri doğru yanlış koltrolü yapılmaya çalışındı yarın tekrar dene
                                    });
                                  }
                                  if(result.contains(" ")){
                                    setState(() {
                                      textControl.clear();
                                    });
                                    if(result.trim()==rndWords[currentIndex]){
                                      setState(() {

                                      });
                                      trueResult++;
                                      currentIndex++;
                                    }
                                  else  if(result.trim()!=rndWords[currentIndex]){
                                      falseResult++;
                                      currentIndex++;
                                    }
                                    setState(() {
                                      textControl.text="";
                                    });
                                  }

                                }
                              },
                              showCursor: true,
                              controller: textControl,
                              style: const TextStyle(fontSize: 26, height: 1),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(0)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              },
                              child: Container(
                                color: Colors.black54,
                                width: 60,
                                height: 45,
                                child: Center(child: Visibility(
                                  visible: isVisible,
                                  child: Text("${myDuration.inSeconds}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),),
                                )),
                              ),
                            ),
                          ),
                          Container(
                              height: 45,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius
                                      .circular(4.0)),
                                  color: Colors.blue
                              ),
                              child: IconButton(
                                  onPressed: () {
                                Restart.restartApp();
                              },
                                  icon: Icon(Icons.restart_alt, color: Colors.white,)))
                        ],
                      ),
                    ]
                ),
              ]
          ),
        ),
      );
    }
  }

