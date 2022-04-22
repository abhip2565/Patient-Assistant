import 'dart:math';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



import "package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: choose(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//
//
//
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//
//
//
//
//
//
//
//
//
//   final firestoreInstance = FirebaseFirestore.instance;
//   dynamic k;
//   //_MyHomePageState({this.k});
//   dynamic k1;
//   Future<void> getdata(String docpath) async{
//   await firestoreInstance.collection("hospitals ").doc(docpath).get().then((value) async {
//     print(value.data());
//     if (value.data()!=null)
//   k= value.data()["name"];
//     else
//       k="no data";
//   }
// );}
// QuerySnapshot snapdata;
// Future<void> getalldata()async{
//     await firestoreInstance.collection("hospitals ").get().then((value){
//       snapdata=value;
//     });
// }
// final cont=TextEditingController();
//   final readcont=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//
//       body: Center(
//         child: Column(
//           // Center is a layout widget. It takes a single child and positions it
//           // in the middle of the parent.
//           children: [Center(
//             child: TextField(
//             controller: cont,
//             ),
//           ),
//             RaisedButton(
//         child: Text("write"),
//         onPressed:() {
//           setState(() {
//             print(cont.text);
//             firestoreInstance.collection("hospitals ").doc(cont.text).set(
//                 {
//                   "name": "abhishek",
//                   "location": 60,
//                 });
//           });
//         }
//
//
//     ),
//     TextField(
//       controller: readcont,
//     ),
//     RaisedButton(
//     child: Text("read"),
//    onPressed:()async {
//
//      await getdata(readcont.text);
//      print(k);
//      Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => screen(k: k,)),
//      );
//
//         //setState(() {
//           //k1 = k;
//      // });
//     }
//
//
//
//
//
//          ),
//             RaisedButton(
//               child:Text("get all data"),
//                 onPressed:() async {
//               await getalldata();
//
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => screen2(data: snapdata,)),
//               );
//             }
//
//             ),
//             RaisedButton(
//                 child:Text("delete"),
//                 onPressed:()async {
//                  await FirebaseFirestore.instance.collection("hospitals ").doc("hello5").delete().then((value) => print("deleted")).catchError((error)=>print("user deleted"));
//             }
//            ),
//
//           ],// This trailing comma makes auto-formatting nicer for build methods.
//     ),
//       ),
//     );
//   }
// }
// // class AddUser extends StatelessWidget {
// //   final String fullName;
// //   final String company;
// //   final int age;
// //
// //   AddUser(this.fullName, this.company, this.age);
// //   @override
// //   Widget build(BuildContext context) {
// //     // Create a CollectionReference called users that references the firestore collection
// //     CollectionReference users = FirebaseFirestore.instance.collection('users');
// //
// //     Future<void> addUser() {
// //       // Call the user's CollectionReference to add a new user
// //       return users
// //           .add({
// //         'full_name': fullName, // John Doe
// //         'company': company, // Stokes and Sons
// //         'age': age // 42
// //       })
// //           .then((value) => print("User Added"))
// //           .catchError((error) => print("Failed to add user: $error"));
// //     }
// class screen extends StatelessWidget{
//   @override
//
// dynamic k;
//   screen({this.k});
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         body:Center(
//           child:Text(k.toString())
//         )
//       ),
//
//     );
//   }
//
// }
// class screen2 extends StatelessWidget
//
// {
//  QuerySnapshot data;
//   screen2({this.data});
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: ListView.builder(
//             itemCount: data.docs.length ,
//             itemBuilder: (BuildContext context, int index)
//     {
//       return ListTile(
// title:Text(data.docs[index].data()["name"]),
//       );
//     }
//
//           )
//
//         ),
//       ),
//     );
//   }
// }
class Login extends StatefulWidget {
  @override
  Loginstate createState() => Loginstate();
}

final firestoreInstance = FirebaseFirestore.instance;

int l = 0;


class Loginstate extends State<Login> {
  bool isloading=false;

  bool ishide=true;
  void toggle(){

    setState(() {
      if(ishide==true) {
        ishide = false;

      }
      else {

        ishide = true;
      }

    });
}
  final username = TextEditingController();
  final password = TextEditingController();
  QuerySnapshot data;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.yellow,
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: GestureDetector(
            onTap: (){
              FocusScopeNode currentFocus=FocusScope.of(context);
              if(!currentFocus.hasPrimaryFocus){
                currentFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
                child: SafeArea(
                  child: Stack(

                    children: [


                          Container(
                          color: Colors.yellow,
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height ,
                        ),

                      Column(

                          children: [
                            Stack(
                              children: [Container(
                              width: MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.height/4,
                                color: Colors.white60,
                          ),
                                Row(

                                  children: [
                                    Container(width: MediaQuery.of(context).size.width/2,
                                        height: MediaQuery.of(context).size.height/4,

                                        child: CircleAvatar(backgroundImage: AssetImage("images/image1.jpg"))),

                                      //Image.network("https://previews.123rf.com/images/julos/julos1607/julos160753453/82734046-cartoon-doctor-with-stethoscope.jpg"),


                                    Text(
                                        "Get Started!",
                                          style:TextStyle(
                                            fontSize: 34,
                                            fontWeight:FontWeight.w900,
                                              color: Colors.deepOrangeAccent,
                                              shadows:[
                                                Shadow(
                                                  color:Colors.black26,
                                                    blurRadius:4.0,
                                                    offset:Offset(4,1)


                                          )
                                              ]
                                          ),
                                    ),
                                  ],
                                ),
                            ]),




              Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        filled: true,
                        fillColor: Colors.orange[200],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),

                      ),
                      controller: username,
                    ),
              ),
              Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      obscureText:ishide,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: "Password",

                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(child: Icon((ishide==true)?Icons.remove_red_eye:Icons.remove_red_eye_outlined),
                        onTap:toggle,
                        ),
                        labelText: "password",

                        filled: true,
                        fillColor: Colors.orange[200],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),

                      ),

                      controller: password,
                    ),
              ),
              Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                           color:Colors.orange,
                            elevation: 20,
                            child: Text(
                              "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:20,
                                ),
                                ),
                            onPressed: () async {
                              if (password.text.length < 8) {
                                setState(() {
                                  if (password.text.length < 8)
                                    l = 1;
                                  else
                                    l = 0;
                                });
                              } else {
                                setState(() {
                                  isloading=true;
                                });
                                await firestoreInstance
                                    .collection("users")
                                    .doc(username.text)
                                    .get()
                                    .then((value) async {
                                  if (value.data() == null) {
                                    setState(() {
                                      isloading=false;
                                      l = 2;
                                    });
                                  } else {
                                    if (value.data()["password"] != password.text) {
                                      setState(() {
                                        isloading=false;
                                        l = 3;
                                      });
                                    } else {

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  intro(username: username.text)));
                                    }
                                    ;
                                  }
                                  ;
                                });
                              }
                              ;
                            }),
                      ),
                    ),
              ),
              Text((l == 1)
                      ? "paswword too short"
                      : (l == 2)
                          ? "user not registered please register"
                          : (l == 3)
                              ? "wrong password"
                              : "",
              style:TextStyle(
                color:Colors.red,
                fontSize:18,
              )
              ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height/40,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right:25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(icon:Icon(Icons.emoji_objects_rounded,
                                  color:Colors.red, )
                                  ),
                                  Text("Forgot password?"),

                                ],
                              ),
                            ),
          

                            (isloading)?CircularProgressIndicator():Container(),


              Text(
                "OR",
                    style:TextStyle(
                  fontSize: 20,
                      color:Colors.orange,
                      fontWeight:FontWeight.bold,
              )
              ),
              Divider(
                thickness: 10,

              ),
              Container(
                    width: MediaQuery.of(context).size.width/1.08,
                    child: RaisedButton(
                        color:Colors.orange,
                        elevation: 20,

                        child: Text(
                            "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                                fontSize:20,
                          ),
                            ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup1()),
                          );
                        }),
              ),
            ]),
                   ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class Signup1 extends StatefulWidget {
  @override
  Signup1State createState() => Signup1State();
}

class Signup1State extends State<Signup1> {
  var l = 0;
  final firestoreInstance = FirebaseFirestore.instance;
  final username = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus=FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus){
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [

                Container(
                 width:MediaQuery.of(context).size.width ,
                height:MediaQuery.of(context).size.height,
                  color:Colors.amberAccent,
                ),

                Column(
                children: [
                  SizedBox(height:90,),

                  Text(
                      "Register",
                    style:TextStyle(
                    fontSize: 40,
                    letterSpacing: 4,
                    color:Colors.deepOrangeAccent,
                    fontWeight:FontWeight.w900,
                        shadows:[
                          Shadow(
                              color:Colors.black26,
                              blurRadius:4.0,
                              offset:Offset(4,1)


                          )
                        ]
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: "Unique Username",
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        filled: true,
                        fillColor: Colors.orange[200],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),

                      ),

                      controller: username,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,5, 15, 0),
                    child: Container(
                      width:MediaQuery.of(context).size.width ,
                      child: RaisedButton(
                        color:Colors.orange,
                        elevation: 20,

                        child: Text("Next",
                        style:TextStyle(
                          color:Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )
                        ),
                        onPressed: () async {
                          if(username.text=="")
                            {
                              setState(() {
                                l=10;
                              });
                            }
                          await firestoreInstance
                              .collection("users")
                              .doc(username.text)
                              .get()
                              .then((value) {
                            if (value.data() != null) {
                              setState(() {
                                l = 1;
                              });
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => Signup2(
                                            username: username.text,
                                          )));
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: (l==10)?Text("Username please :D", style:TextStyle(
                      color:Colors.red,
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                    )):Text((l == 1) ? "Username not available!" : " ",
                        style:TextStyle(
                          color:Colors.red,
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  )
                ],
              ),
    ],
            ),
          ),
        ),
      ),
    );
  }
}

class Signup2 extends StatefulWidget {
  String username;
  Signup2({this.username});
  @override
  Signup2State createState() => Signup2State(s: username);
}

class Signup2State extends State<Signup2> {
  var ishide=true;
  var k=0;
  void toggle(){

    setState(() {
      if(ishide==true) {
        ishide = false;
        k=0;
      }
      else {
        k=1;
        ishide = true;
      }

    });
  }
  final firestoreInstance = FirebaseFirestore.instance;
  var l;
  String s;
  Signup2State({this.s});

  final pass = TextEditingController();
  final conpass = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus=FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus){
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [

                Container(
                  width:MediaQuery.of(context).size.width ,
                  height:MediaQuery.of(context).size.height ,

                ),

                Column(
                children: [
                  SizedBox(height:90,),
                  Text(
                    "ONE LAST STEP...",
                        style:TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    color:Colors.deepOrangeAccent,
                    fontWeight:FontWeight.w900,
                    shadows:[
                      Shadow(
                          color:Colors.black26,
                          blurRadius:4.0,
                          offset:Offset(4,1)


                      )
                    ]
                )
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,50,8,10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: "New Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(child: Icon((k==1)?Icons.remove_red_eye:Icons.remove_red_eye_outlined),
                        onTap:toggle,
                        ),
                        filled: true,
                        fillColor: Colors.orange[200],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),

                      ),
                      obscureText:ishide,
                      controller: pass,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,10,8,0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.orange[200],
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),

                      ),
                      controller: conpass,
                    ),
                  ),
                  SizedBox(height:30),
                  Container(
                    width:MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color:Colors.orange,
                        elevation: 20,
                        child: Text(" Register"
                        ,
                            style:TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        onPressed: () async {
                          if(pass.text=="" && conpass.text=="")
                            {
                              setState(() {
                                l=10;
                              });
                            }
                          else if (pass.text.length < 8) {
                            setState(() {
                              l = 1;
                            });
                          } else if (conpass.text != pass.text) {
                            setState(() {
                              l = 2;
                            });
                          } else {
                            await firestoreInstance.collection("users").doc(s).set({
                              "password": pass.text,
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()));
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height:10),
                  (l==10)?Text("Please set up a password",
                      style:TextStyle(
                        color:Colors.red,
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                      )
                  ):Text((l == 1)
                      ? "Password too short"
                      : (l == 2)
                          ? "confirm password did not match"
                          : "",
                      style:TextStyle(
                        color:Colors.red,
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ],
              )],
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  QuerySnapshot data;
  String username;
  Home({this.data, this.username});

  HomeState createState() => HomeState(data: data, username: username);
}

class HomeState extends State<Home> {
  String username;
  HomeState({this.data, this.username});

  final firestoreInstance = FirebaseFirestore.instance;
  QuerySnapshot data;
  QuerySnapshot data1;
  QuerySnapshot unslot;
  int l1;
  List l = ["no data"];
  final search = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        //  backgroundColor:Colors.yellow[200],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(110),
            child:AppBar(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
              backgroundColor: Colors.orangeAccent,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Doctors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize:MediaQuery.of(context).size.width/18,

                      ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.width/40 ,),
                      Container(
                        height:MediaQuery.of(context).size.height/17.5,
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: InkWell(child: Icon(Icons.search),

                                  onTap:()async{

                                    await firestoreInstance
                                        .collection("doctors")
                                        .where("search",
                                        isGreaterThanOrEqualTo: search.text.toLowerCase())
                                        .orderBy("search")
                                        .get()
                                        .then((value) {
                                      setState(() {
                                        data = value;
                                      });
                                    });
                                  }


                              ),
                              hintText: "Search",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(10)),

                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )),
                          controller: search,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
            body: GestureDetector(
              onTap: (){
                FocusScopeNode currentFocus=FocusScope.of(context);
                if(!currentFocus.hasPrimaryFocus){
                  currentFocus.unfocus();
                }
              },
              child: Column(
      children: [


        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: (data.docs.length==0)?Text("No matches"):ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      color: Colors.yellow[100],
                      child: Container(
                        child: ListTile(
                            title: Text(data.docs[index].data()["name"],style: TextStyle(
                              fontSize: 22
                            ),),
                             subtitle: Text(data.docs[index].data()["search"],style: TextStyle(fontSize: 20),) ,
                             onTap: () async{
                            //   await firestoreInstance.collection("appo").where("doctor", isEqualTo:data.docs[index].data()["name"] ).get().then((value){
                            //     unslot=value;
                            //   });
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => doctor(
                            //             name: data.docs[index].data()["name"],
                            //             username: username, unslot:unslot)),
                            //   );
                            // }
                            showModalBottomSheet<void>(
                               backgroundColor: Colors.amberAccent,
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                            context: context,
                            builder: (BuildContext context) {

                            return Container(
                              height:MediaQuery.of(context).size.height/2.5,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: CircleAvatar(backgroundImage: AssetImage("images/doc"+"$index"+".jpg"),radius: MediaQuery.of(context).size.width/4.5,),
                                    ),
                                    Column(
                                      children: [
                                        Text(data.docs[index].data()["name"],style:TextStyle(fontSize:MediaQuery.of(context).size.width/18 ),),
                                        Text("Cardiologist",style:TextStyle(fontSize:MediaQuery.of(context).size.width/23 ),),
                                        SizedBox(height:MediaQuery.of(context).size.height/20),
                                        Text("Experienced Doctor"),
                                      ],
                                    ),

                                  ],

                                ),

                                Divider(thickness: 5,),
                                Container(
                                  width:MediaQuery.of(context).size.width/2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      color:Colors.orange,
                                      child: Text("Book",style:TextStyle(fontSize:MediaQuery.of(context).size.width/15,color: Colors.white)),
                                      onPressed:()async{
                                             await firestoreInstance.collection("appo").where("doctor", isEqualTo:data.docs[index].data()["name"] ).get().then((value){
                                          unslot=value;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => doctor(
                                                  name: data.docs[index].data()["name"],
                                                  username: username, unslot:unslot)),
                                        );

                                      } ,
                                    ),
                                  ),
                                ),
                              ],
                            )

    );}
    );}


                        ),
                      ),
                    );
                  }),
          ),
        ),
      ],
    ),
            )));
  }
}

class intro extends StatefulWidget {
  String username;
  intro({this.username});

  @override
  _introState createState() => _introState(username:username);
}

class _introState extends State<intro> {
  QuerySnapshot data;
  String username;
  _introState({this.username});
  var namedr=["","DR. ABhi","Dr. Shyamal","Dr. Peter","Dr. Rajesh"];

  var pos=["","cardiologist","neurologist","cardiologist","orthopedic"];

  Future<void> logout() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sure to Log Out"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("NO")),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Login()));
                  },
                  child: Text("YES"))

            ],
          );
        });
  }

  QuerySnapshot data1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

        home: Scaffold(

        appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
    child:AppBar(
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
    backgroundColor: Colors.orangeAccent,
    flexibleSpace: SafeArea(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children:[
        //Icon(Icons.menu),



        SizedBox(width: 50,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Welcome!",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize:24,

          ),
          ),
        ),
      ]
    )
    )
    )
    )
        ),
      bottomNavigationBar:Container(width:MediaQuery.of(context).size.width,height:60 ,


        child: RaisedButton(
          color: Colors.orangeAccent,
          onPressed: ()async {await firestoreInstance
        .collection("doctors")
        .get()
        .then((value) {
    data = value;

    });

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    Home(data: data, username: widget.username)),
    );
  },
          child: Center(child:Text("BOOK APPOINTMENT",
            style:TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height/35,color:Colors.white)
            ),

      ),
        ),),

        drawer:Drawer(
          child: Container(
          color:Colors.yellow[100],
           child: ListView(
            children:[
              ListTile(
                title:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[CircleAvatar(radius: MediaQuery.of(context).size.width/7,backgroundImage:AssetImage("images/image1.jpg"),),SizedBox(height:MediaQuery.of(context).size.height/34),Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.transparent),
                    child: Text("Welcome"+"   "+username, style:TextStyle(
                      fontSize:25,color:Colors.deepOrange,
                    )),
                  )]
                )
                ),

              Divider(thickness:5),
              SizedBox(height:MediaQuery.of(context).size.height/12),
              Divider(thickness:2.5),
              ListTile(
                leading:FlatButton(
                  onPressed: ()async{

                    await firestoreInstance
                        .collection("patients")
                        .where("username", isEqualTo: widget.username)
                        .get()
                        .then((value) {
                      data1 = value;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              appo(data: data1, username: widget.username)),
                    );

                  },
                  child:Text("Your bookings",style:TextStyle(fontSize:25,color:Colors.orange,fontWeight: FontWeight.bold))
                ),
              ),
              Divider(thickness:2),

              ListTile(
                leading:FlatButton(
                  child:Text("Book  appointment",style:TextStyle(fontSize:25,color:Colors.orange,fontWeight: FontWeight.bold)),
                  onPressed: ()async {await firestoreInstance
                  .collection("doctors")
                  .get()
                  .then((value) {
              data = value;

              });

              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              Home(data: data, username: widget.username)),
              );
              },


                ),
              ),
              Divider(thickness:2),


              ListTile(
                  leading:FlatButton(
                      child:Text("Log Out",style:TextStyle(fontSize:25,color:Colors.orange,fontWeight: FontWeight.bold)),
                         onPressed:() {logout();},
                  )
              ),
              Divider(thickness:2),

            ]
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(child:Container(
              child:Image(image:AssetImage("images/image"+"$index"+"app.jpg"),
                  fit:BoxFit.fill,
            ),)

            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/8,
          );
          }

          ),
        ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/3.5,



    ),

            Divider(thickness:2.5,color:Colors.orange[100]),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Services we provide",
              style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.deepOrange)),
            ),
            Row(children:[



              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child:Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child:Image(image:AssetImage("images/image5.png"),

                          ),
                          height: 80,width:80,
                          ),
                        ),

                        Text("Proper ",style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                        Text("Diagonistics", style:TextStyle(
                          fontSize:17,
                              fontWeight:FontWeight.bold,

                        )),
                      ],
                    ),
                    height:150,width:MediaQuery.of(context).size.width/3.55,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.orangeAccent[100],Colors.yellow[100]]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child:Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child:Image(image:AssetImage("images/image6.png"),

                          ),
                            height: 80,width:80,
                          ),
                        ),

                        Text("Emergency ",style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                        Text("Servives", style:TextStyle(
                          fontSize:17,
                          fontWeight:FontWeight.bold,

                        )),
                      ],
                    ),
                    height:150,width:MediaQuery.of(context).size.width/3.55,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.orangeAccent[100],Colors.yellow[100]]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child:Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child:Image(image:AssetImage("images/image7.png"),

                          ),
                            height: 80,width:80,
                          ),
                        ),

                        Text("Ambulance ",style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                        Text("Servives", style:TextStyle(
                          fontSize:17,
                          fontWeight:FontWeight.bold,

                        )),
                      ],
                    ),

                    height:150,width:MediaQuery.of(context).size.width/3.55,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.orangeAccent[100],Colors.yellow[100]]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),

        ]),

            Divider(thickness:3, color:Colors.orange[100]),
            SizedBox(height:15),
               Padding(
                 padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                 child: Text("Our Achievements",
          style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.deepOrange)),
               ),
            SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Container(

                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[


                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("BEST HOSPITAL AWARDS 2021" ,style:TextStyle(fontSize: MediaQuery.of(context).size.width/24, fontWeight: FontWeight.bold,color:Colors.white)),
                            ),

                            Image(image:AssetImage("images/award1.png")),
                          ]
                        ),
                    height:80,width:MediaQuery.of(context).size.width/1.2,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.deepOrange,Colors.yellow]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("BEST SERVICES AWARD" ,style:TextStyle(fontSize: MediaQuery.of(context).size.width/24, fontWeight: FontWeight.bold,color:Colors.white)),
                          ),

                          Image(image:AssetImage("images/award1.png")),
                        ]
                    ),
                    height:80,width:MediaQuery.of(context).size.width/1.2,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.deepOrange,Colors.yellow]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("BEST SCIENCE DEVELOPMENT" ,style:TextStyle(fontSize: MediaQuery.of(context).size.width/24, fontWeight: FontWeight.bold,color:Colors.white)),
                          ),

                          Image(image:AssetImage("images/award1.png")),
                        ]
                    ),
                    height:80,width:MediaQuery.of(context).size.width/1.2,decoration:BoxDecoration(
                  gradient:LinearGradient(colors:[Colors.deepOrange,Colors.yellow]),
                  borderRadius:BorderRadius.circular(20),
                )),
              ),
            ),

            Divider(thickness:3, color:Colors.orange[100]),
            SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
              child: Text("Top Doctors",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.deepOrange)),
            ),
            CarouselSlider(
              options: CarouselOptions(autoPlay:true,height: 200.0,enlargeCenterPage: true),


              items: [1,2,3,4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child:Row(
                           children:[Container(
                               height:200,
                               width: MediaQuery.of(context).size.height/5.5,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: CircleAvatar(backgroundImage:AssetImage(

                                     "images/doc$i.jpg")),
                               )),
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(10,30,0,0),
                                   child: Text(
                                       namedr[i],style:TextStyle(fontSize:MediaQuery.of(context).size.width/20,fontWeight: FontWeight.bold,),
                                      ),
                                 ),

                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(10,30,0,0),
                                   child: Text(
                                     pos[i],style:TextStyle(fontSize:MediaQuery.of(context).size.width/22,fontWeight: FontWeight.bold,),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(15.0,8,0,0),
                                   child: Text("Experience $i years", style:TextStyle(fontSize: MediaQuery.of(context).size.width/27)),
                                 ),
                               ],
                             ),

                           ]
                          ),

                          decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(25),),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2),
                    );

                  },
                );
              }).toList(),
            ),

            Divider(thickness:3, color:Colors.orange[100]),
            SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
              child: Text("Avail an Appointment",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.deepOrange)),
            ),
            SizedBox(height:15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,15,0),
                  child: CircleAvatar(radius:10,backgroundColor:Colors.deepOrangeAccent),
                ),
                Text(" Tap on  BOOK APPOINTMENT ", style:TextStyle(fontSize:MediaQuery.of(context).size.width/25)),
              ],
            ),
            SizedBox(height:15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,15,0),
                  child: CircleAvatar(radius:10,backgroundColor:Colors.deepOrangeAccent),
                ),
                Text("Select your preferred doctor",style:TextStyle(fontSize:MediaQuery.of(context).size.width/25)),
              ],
            ),
            SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,15,0),
              child: Row(
                children: [
                  CircleAvatar(radius:10,backgroundColor:Colors.deepOrangeAccent),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Text("Select your preferred time slot ",style:TextStyle(fontSize:MediaQuery.of(context).size.width/25)),
                  ),
                ],
              ),
            ),
            SizedBox(height:15),
            Row(

              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,15,0),
                  child: CircleAvatar(radius:10, backgroundColor:Colors.deepOrangeAccent),
                ),
                Text("Wait for the confirmation",style:TextStyle(fontSize:MediaQuery.of(context).size.width/25)),
              ],
            ),
            SizedBox(height:15),
           //Center(child: Text("You are all set!",style:TextStyle(fontSize:MediaQuery.of(context).size.width/18,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold))),








    ],
        ),
      ),

    ));
  }
}

class doctor extends StatefulWidget {
  @override
  String name;
  String username;
  QuerySnapshot unslot;
  var current = null;
  var current1 = null;
  doctor({this.name, this.username, this.unslot});
  doctorState createState() => doctorState(name: name, username: username, unslot:unslot);
}


class doctorState extends State<doctor> {

  void initState()
  {
    super.initState();
    setState(() {

    });
  }

  final firestoreInstance = FirebaseFirestore.instance;
  final patientname = TextEditingController();
  final age = TextEditingController();
  String current;
  String current1;
  final now=DateTime.now();

  Future<void> datepick(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(now.year,now.month,now.day+1),
        firstDate: DateTime(now.year,now.month,now.day+1),
        lastDate: DateTime(now.year,now.month+6,now.day));



      setState(() {
        current = pickedDate.day.toString()+"/ "+pickedDate.month.toString()+"/ "+pickedDate.year.toString();
        print(current);

      });

  }
  final ScrollController s=ScrollController();
  QuerySnapshot unslot;
  var isloading=false;
  Future<void> book() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Appointmentconfirmed"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }



  String username;
  var date = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  var hour = ["10", "11", "12", "13", "14", "15", "16", "17", "18"];
  String name;
  doctorState({this.name, this.username, this.unslot});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
              child:AppBar(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
                  backgroundColor: Colors.orangeAccent,
                  flexibleSpace: SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              children:[
                                //Icon(Icons.menu),



                                SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Book your appointment",
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize:MediaQuery.of(context).size.height/35,

                                    ),
                                  ),
                                ),
                              ]
                          )
                      )
                  )
              )
          ),
      resizeToAvoidBottomInset: false,
      body: Column(

        children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("Welcome to appointment page of $name",style:TextStyle(fontSize:MediaQuery.of(context).size.width/22)),
      ),
      Divider(thickness:2,color:Colors.orange),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Container(
          child: Text("Select Date",style:TextStyle(fontSize:MediaQuery.of(context).size.width/22)),
        ),
      //   DropdownButton(
      //     items: date.map((String element) {
      //       return DropdownMenuItem(
      //         child: Text(element),
      //         value: element,
      //       );
      //     }).toList(),
      //     onChanged: (String value1) {
      //       setState(() {
      //         current = value1;
      //       });
      //     },
      //     value: current,
      //     hint: Text("Choose"),
      //   )
        //
       RaisedButton(
         color:Colors.orange,
           child:(current==null)?Text("Choose",style:TextStyle(color:Colors.white)):Text(current,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
           onPressed: (){
         datepick(context);
       })
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Container(
          child: Padding(
             padding: const EdgeInsets.all(20.0),
            child: Text("Select Hour",style:TextStyle(fontSize:MediaQuery.of(context).size.width/22)),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(

                items: hour.map((String element) {
                  return DropdownMenuItem(
                    child: Text(element),
                    value: element,
                  );
                }).toList(),
                onChanged: (String value1) {
                  setState(() {
                    current1 = value1;
                  });
                  if (current != null && current1 != null)
                    print(current + "" + current1);
                },
                value: current1,
                hint: Text("Choose",style:TextStyle(color: Colors.orange,fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ]),
      Divider(thickness: 2.5,color:Colors.orange,),

      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text("ENTER YOUR NAME: ",style:TextStyle(color:Colors.deepOrange,fontSize:MediaQuery.of(context).size.width/22











        )),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 5),
        child: TextField(
         decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            hintText: "Patient Name",
            prefixIcon: Icon(Icons.account_circle_rounded),
            filled: false,
            fillColor: Colors.orange[200],
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),

          ),
          controller: patientname,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.orange,

            onPressed: () async {
              if (current != null &&
                  current1 != null &&
                  patientname.text != "") {
                String concat =
                    "DATE : " + current + "  TIME : " + current1;
                setState(() {
                  isloading=true;
                });
                await firestoreInstance
                    .collection("patients")
                    .where("doctor", isEqualTo: name)
                    .where("slot", isEqualTo: concat)
                    .get()
                    .then((value) async {
                  if (value.docs.isEmpty) {
                    await firestoreInstance.collection("patients").add({
                      'doctor': name,
                      'slot': concat, // Stokes and Sons
                      'patientname': patientname.text,
                      "username": username,
                      "date": current,
                      "status": "pending",
                    });
                    await firestoreInstance.collection("appo").add({
                      'doctor': name,
                      'slot': concat,
                      'patientname': patientname.text,
                      "username": username,
                      "date": current,
                      "status": "pending",
                    });

                    setState(() {
                      l = 1;
                      isloading=false;
                      book();
                    });
                  } else {
                    setState(() {
                      isloading=false;
                      l = 2;
                    });
                  }
                });
              } else {
                setState(() {
                  isloading=false;
                  l = 10;
                });
              }
            },
            child: Text("Confirm",style:TextStyle(color:Colors.white,fontSize:MediaQuery.of(context).size.width/22))),
      ),
      Text((l == 10)
          ? "Please Fill all fields"
          : (l == 2)
              ? "slot not available"
              : "", style: TextStyle(fontSize:MediaQuery.of(context).size.width/22,color: Colors.red,fontWeight: FontWeight.bold),),

              Divider(thickness:3, color:Colors.orange),
          (isloading==true) ?CircularProgressIndicator():Container(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text("UNAVAILABLE    SLOTS",style: TextStyle(fontSize:MediaQuery.of(context).size.width/22,color: Colors.deepOrange,fontWeight: FontWeight.bold)))
              ),
              Container(


                child: Expanded(
                    child: (unslot.docs.isEmpty)?Text("no unavailable slot"):Scrollbar(
                      thickness: 5,
                      isAlwaysShown: true,
                        controller:s,
                      child: ListView.builder(
                      itemCount: unslot.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width:2.5,color:Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Card(
                            elevation:2,
                            color:Colors.amberAccent[100],
                            child:ListTile(
                              title:Text(unslot.docs[index].data()["slot"],style:TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/24,)),
                            )

      ),
                        ),
                      );}),
                    ),),
              ),

        ],
      ),
    ));
  }
}



class appo extends StatefulWidget {
  QuerySnapshot data;
  String username;
  appo({this.username, this.data});
  // ignore: empty_constructor_bodies
  @override
  appoState createState() => appoState(data: data, username: username);
}

class appoState extends State<appo> {
  void initState(){
    setState(() {

    });
  }
  Future<void> book(int index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Do You Want To cancel The Appointment??"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              FlatButton(
                  onPressed: () async{

                    await firestoreInstance.collection("appo").where("doctor",isEqualTo:data.docs[index].data()["doctor"] ).where("slot", isEqualTo: data.docs[index].data()["slot"]).get().then((value)async{
                      if(value.docs.isNotEmpty) {
                        var ids = value.docs[0].id;
                        await firestoreInstance.collection("appo")
                            .doc(ids)
                            .delete();
                      }
                    });
                    await firestoreInstance
                        .collection("patients")
                        .doc(data.docs[index].id)
                        .delete();

                    await firestoreInstance
                        .collection("patients")
                        .where("username", isEqualTo: username)
                        .get()
                        .then((value) {
                      data1 = value;
                    });
                    setState(() {
                      data = data1;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }
  final firestoreInstance = FirebaseFirestore.instance;
  String username;
  QuerySnapshot data;
  appoState({this.data, this.username});
  QuerySnapshot data1;
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
              child:AppBar(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
                  backgroundColor: Colors.orangeAccent,
                  flexibleSpace: SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              children:[
                                //Icon(Icons.menu),



                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Your Bookings",
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize:24,

                                    ),
                                  ),
                                ),
                              ]
                          )
                      )
                  )
              )
          ),

        body: Scrollbar(
         

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: (data.docs.isEmpty)?Center(child: Text("No bookings yet",style: TextStyle(fontSize: 20),)):ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    color: Colors.yellow[100],
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(data.docs[index].data()["doctor"]),
                          subtitle: Text(data.docs[index].data()["slot"]),

                          ),

                        Divider(thickness:2, color:Colors.orange),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [

                            Text("Status: "+""+data.docs[index].data()["status"], style:TextStyle(color:(data.docs[index].data()["status"]=="confirmed")?Colors.green:Colors.blue,fontSize: 18)),

                            FlatButton(

                              onPressed:(){ book(index);} ,
                  child: Text("Cancel",style:TextStyle(fontSize:16,color:Colors.red))),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class DoctorLogin extends StatefulWidget {
  @override
  DoctorLoginState createState() => DoctorLoginState();
}

class DoctorLoginState extends State<DoctorLogin> {
  final name = TextEditingController();
  final pass = TextEditingController();
  int l = 0;
  bool ishide=true;
  void toggle(){

    setState(() {
      if(ishide==true) {
        ishide = false;

      }
      else {

        ishide = true;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          
        resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,



      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors:[Colors.white,Colors.yellow[200],Colors.orangeAccent[100]],
            begin:Alignment.topCenter,
            end:Alignment.bottomCenter
          )
        ),
        child: Column(children: [

        SizedBox(height:MediaQuery.of(context).size.height/8),


          Container(
             height:MediaQuery.of(context).size.height/4,
              child: Image(image:AssetImage("images/doctor2.png"))),
          SizedBox(height:10),

          Text("Welcome Doctor!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.deepOrangeAccent)),
          SizedBox(height:40),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  hintText: "Username",
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  filled: true,
                  fillColor: Colors.orange[200],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),

                ),
                controller: name,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText:ishide,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: "Password",

                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(child: Icon((ishide==true)?Icons.remove_red_eye:Icons.remove_red_eye_outlined),
                  onTap:toggle,
                ),
                labelText: "password",

                filled: true,
                fillColor: Colors.orange[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),

              ),
              controller: pass,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(

              width: MediaQuery.of(context).size.width/1.5,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color:Colors.orangeAccent,
                onPressed: () async {
                  await firestoreInstance
                      .collection("doctors")
                      .doc(name.text)
                      .get()
                      .then((value) {
                    if (value.data() == null) {
                      setState(() {
                        l = 1;
                      });
                    } else if (value.data()["password"] != pass.text) {
                      setState(() {
                        l = 2;
                      });
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorHome(doctorname: name.text)));
                      ;
                    }
                  });
                },
                child: Text("SignIn",style: TextStyle(fontSize:20,color:Colors.white)),
              ),
            ),
          ),
          Text((l == 1)
              ? "user  not registered"
              : (l == 2)
                  ? "password incorrect"
                  : ""),
        ]),
      ),
    ));
  }
}

class DoctorHome extends StatefulWidget {
  String doctorname;
  DoctorHome({this.doctorname});
  DoctorHomeState createState() => DoctorHomeState(doctorname: doctorname);
}

class DoctorHomeState extends State<DoctorHome> {
  String doctorname;
  int k=0;
  QuerySnapshot data;
  DoctorHomeState({this.doctorname});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
            child:AppBar(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
                backgroundColor: Colors.orangeAccent,
                flexibleSpace: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            children:[
                              //Icon(Icons.menu),



                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Welcome!",
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize:24,

                                  ),
                                ),
                              ),
                            ]
                        )
                    )
                )
            )
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Welcome doctor", style:TextStyle(fontSize:MediaQuery.of(context).size.width/14,color:Colors.orange,fontWeight:FontWeight.bold)),
              ),
              RaisedButton(

                color:Colors.orangeAccent,
                onPressed:()async {
                await firestoreInstance.collection("appo").where("doctor", isEqualTo: doctorname).get().then((value){data=value;
                ;
                });
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DoctorBooks(name:doctorname,data:data)) );
              },
              child:Text("Check Schedule",style: TextStyle(color:Colors.white,fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorBooks extends StatefulWidget {
  String name;
  QuerySnapshot data;
  DoctorBooks({this.name,this.data});
  @override
  DoctorBooksState createState() => DoctorBooksState(name:name,data:data);
}
final now=DateTime.now();
class DoctorBooksState extends State<DoctorBooks> {
String current1;
  Future<void> datepick(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(now.year, now.month, now.day),
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(now.year, now.month + 6, now.day));
   String date = pickedDate.day.toString()+"/ "+pickedDate.month.toString()+"/ "+pickedDate.year.toString();
    await firestoreInstance.collection("appo").where("doctor", isEqualTo: name).where("date", isEqualTo:date ).get().then((value){
      data=value;
    });
    setState(() {
      current =date;
      current1=current;
    });
    print(date);
  }


    String name;
  int k=0;
  DoctorBooksState({this.name,this.data});
  QuerySnapshot data;
  final firestoreInstance = FirebaseFirestore.instance;
  var hour = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String current;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
            child:AppBar(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))),
                backgroundColor: Colors.orangeAccent,
                flexibleSpace: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            children:[
                              //Icon(Icons.menu),



                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Schedule",
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize:24,

                                  ),
                                ),
                              ),
                            ]
                        )
                    )
                )
            )
        ),
        body: Column(
          children: [
            SizedBox(height:25),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color:Colors.orangeAccent,
                onPressed: (){
                datepick(context);

              },
              child:Text((current1==null)?"choose":current1,style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize:20,)),
              ),
              RaisedButton(
                color:Colors.orangeAccent,
                onPressed:()async {
      await firestoreInstance.collection("appo").where("doctor", isEqualTo: name).get().then((value){setState(() {
        data=value;
      });

      });
        setState(() {
          current1="choose";
        });
      },
                child:Text("Show all",style:TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize:20,),
              ),
              )],
          ),
            Divider(thickness: 2,color:Colors.orange,),
            SizedBox(height:20),


            Expanded(child: ListView.builder(
        itemCount: data.docs.length,
        itemBuilder: (BuildContext context, int index) {
    return Card(
    elevation: 10,
    color: Colors.yellow[100],
    child: Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Center(
                child: ListTile(
            title:Text(data.docs[index].data()["patientname"]),
                subtitle:Text(data.docs[index].data()["slot"]),
            ),
              ),
            Row(
              children: [
                TextButton(onPressed:()async{

                 await firestoreInstance.collection("patients").where("doctor",isEqualTo:data.docs[index].data()["doctor"] ).where("slot", isEqualTo: data.docs[index].data()["slot"]).get().then((value)async{
                  var ids= value.docs[0].id;
                  await firestoreInstance.collection("patients").doc(ids).update({"status":"cancelled"});
                 });
                 await firestoreInstance.collection("appo").doc(data.docs[index].id).delete();
                 await firestoreInstance.collection("appo").where("doctor", isEqualTo: name).where("date", isEqualTo: current).get().then((value){
                   setState(() {
                     data=value;
                   });

                 });

                 }, child: Text("Cancel")),
               TextButton(
                  child:Text((k==0)?"Confirm":"Confirmed"),
                  onPressed:()async{(k==1)?null:
          await firestoreInstance.collection("patients").where("doctor",isEqualTo:data.docs[index].data()["doctor"] ).where("slot", isEqualTo: data.docs[index].data()["slot"]).get().then((value)async{
          var ids= value.docs[0].id;
          await firestoreInstance.collection("patients").doc(ids).update({"status":"confirmed"});

          });
            setState(() {
               k=1;
            });
          }
          )
              ],
            ),
            ]


    ),),);
    }),
            ) ],
    ),
      ),
    );
  }
}
class choose extends StatefulWidget{
  @override
  _chooseState createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.orangeAccent,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Log in as : ",style:TextStyle(fontSize:40,fontWeight:FontWeight.bold,color:Colors.white)),
            SizedBox(height:MediaQuery.of(context).size.height/10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                GestureDetector(
                  onTap:(){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorLogin()),
      ); },

                  child: Container(
                      decoration:BoxDecoration(
                        //border: Border.all(color:Colors.red,width:2,style: BorderStyle.solid),
                        color:Colors.yellow[100],
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [BoxShadow(
                          color:Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                            offset:Offset(0,3),
                        )]
                      ),

                    height:MediaQuery.of(context).size.height/6,
                    width:MediaQuery.of(context).size.height/6,
                    child:Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(

                            height:MediaQuery.of(context).size.height/10,
                            width:MediaQuery.of(context).size.height/10,
                            child:Image(image:AssetImage("images/doctor.png"),fit:BoxFit.fill),
                          ),
                        ),
                        SizedBox(height:15),
                        Text("DOCTOR",style: TextStyle(fontSize: 24)),
                      ]
                    )
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Navigator.push(
         context,
          MaterialPageRoute(builder: (context) => Login()),
      );
                  } ,
                  child:Container(
                    decoration:BoxDecoration(
                        boxShadow: [BoxShadow(
                        color:Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:Offset(0,3),
                        )],
                      borderRadius: BorderRadius.circular(40),
                      //border: Border.all(color:Colors.red,width:2,style: BorderStyle.solid),
                      color:Colors.yellow[100],
                    ),

                    height:MediaQuery.of(context).size.height/6,
                    width:MediaQuery.of(context).size.height/6,
                    child:Column(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height:MediaQuery.of(context).size.height/10,
                              width:MediaQuery.of(context).size.height/10,
                              child:Image(image:AssetImage("images/patient.png"),fit:BoxFit.fill),
                            ),
                          ),
                          SizedBox(height:15),
                          Text("PATIENT",style: TextStyle(fontSize: 24)),
                        ]
                    )
                ),),

              ]
            ),
          ],
        )
      )
    );

  }
}


