import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List contacts = [];
  late String newUser;

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();

    contacts.addAll(['Константин', 'Родиончик', 'Мирослава']);
  }

  // void menuOpen(){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
  //     return Scaffold(
  //       appBar: AppBar(
  //         title: Text('Меню'),
  //       ),
  //     );
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //leading: const Icon(Icons.menu),
        title: const Text('Список клиентов'),
        centerTitle: true,
      ),
      body: ListView.builder(
              itemCount: contacts.length,

              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                    key: Key(contacts[index]),
                    // child: Card(
                    //     elevation: 20,
                    //     color: Colors.blueAccent,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(50),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         SizedBox(width: 20),
                    //         Column(
                    //           children: [
                    //             SizedBox(height: 5),
                    //             Text(contacts[index], style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                    //             SizedBox(height: 5),
                    //             Text('Stavrinova Studio'),
                    //             SizedBox(height: 10)
                    //           ],
                    //         ),
                    //
                    //         Expanded(
                    //           child: IconButton(
                    //             alignment: Alignment.centerRight,
                    //             onPressed: (){
                    //           setState(() {
                    //             contacts.removeAt(index);
                    //           });
                    //         }, icon: const Icon(Icons.delete), color: Colors.white)),
                    //       ],
                    //     )
                    //     ),
                    child: Card(
                      child: ListTile(
                        tileColor: Colors.lightBlue,
                        title: Text(contacts[index]),
                        trailing: IconButton(onPressed: (){
                          setState(() {
                            contacts.removeAt(index);
                          });
                        }, icon: const Icon(Icons.delete), color: Colors.white),
                        subtitle: const Text('Stavrinova Studio'),
                      ),
                    ),
                  //
                onDismissed: (direction){
                      setState(() {
                        contacts.removeAt(index);
                      });
                },);
              }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Container(
                alignment: Alignment.center,
                color: Colors.blueAccent[200],
                width: double.infinity,
                height: 45,
                child: const Text('Добавить клиента', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
            content: TextField(
              onChanged: (String value){
                newUser = value;
          },
          ),

            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Align(alignment: Alignment.center),
                  Expanded(
                    //width: 100,
                      child: ElevatedButton(onPressed: (){
                    // setState(() {
                    //   contacts.add(newUser);
                    // });
                    Navigator.of(context).pop();
                  }, child: const Text('Cancel'))),
                  SizedBox(width: 15),
                  Expanded(
                      child: ElevatedButton(onPressed: (){
                        FirebaseFirestore.instance.collection('clients').add({'item': newUser});
                        Navigator.of(context).pop();
                  }, child: const Text('OK!')))
                ],
              )
            ],
          );
        });
      },child: const Icon(Icons.add),)
    );
  }
}
