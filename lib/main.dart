import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
  String text = "X";
  static const String PlayerX = "X";
  static const String PlayerY = "O";
  String? currentPlayer;
  bool isGameEnd = false;

  List<String> mesgulMu = ["", "", "", "", "", "", "", "", ""];
  @override
  void initState() {
    // TODO: implement initState
    currentPlayer = PlayerX;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Color(0xFF2980B9),

      appBar: AppBar(
        title: Text("XOX"),
        backgroundColor:currentPlayer==PlayerX ?  Colors.blue:Colors.red,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                  child: Text(
                    "Sıra : ${currentPlayer}",
                    style: TextStyle(fontSize: 23),
                  ),
                )),
            Flexible(
              flex: 4,
              child: Container(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return myContainer(context, text, index);
                  },
                ),
              ),
            ),
            Flexible(flex: 1, child: Container(
              padding: EdgeInsets.all(8),
              child: ElevatedButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
              }, icon: Icon(Icons.replay_outlined), label: Text("Tekrar")),
            ))
          ],
        ),
      ),
    );
  }
  Control(){
List<List<int>> kazanmaSekilleri=[
[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]

];
bool dene=false;
for(var temp in kazanmaSekilleri){
  String a =mesgulMu[temp[0]];
   String b =mesgulMu[temp[1]];
    String c =mesgulMu[temp[2]];
if(a.isNotEmpty){
  if(a==b && a==c){
      ShowMessage("${a}");
      isGameEnd=true;
      
     break;
    }
}

}






  }
  ShowMessage(String message){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Color(0xFFF4D03F),content: Text("Oyun Bitti Kazanan ${message} ",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,))));
  }

  Widget myContainer(BuildContext context, String text, int index) {
    return InkWell(
      onTap: () {
 
        if (isGameEnd || mesgulMu[index].isNotEmpty) {
          return ;
        }
        setState(() {
          mesgulMu[index] = currentPlayer!;
          ChangeRow();
          Control();
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: mesgulMu[index].isEmpty
                ? Colors.grey
                : mesgulMu[index] == PlayerX
                    ? Colors.blue
                    : Colors.red),
        child: Center(
            child: Text(
          "${mesgulMu[index]}",
          style: TextStyle(fontSize: 55),
        )),
      ),
    );
  }

  ChangeRow() {
    if (currentPlayer == PlayerX) {
      currentPlayer = PlayerY;
    } else {
      currentPlayer = PlayerX;
    }
  }
}
