import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gassmen/auth_screen.dart';
import 'package:gassmen/constans.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TryPage extends StatefulWidget {
  const TryPage({Key? key}) : super(key: key);

  @override
  _TryPageState createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  List filters = ['Все датчики','Датчики утечки','Датчик контроля'];
  List list=[];
  bool flag = true;

  _test() async {
    var data = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/sensors'));

    setState(() {
      list = json.decode(data.body.toString());

      DateFormat dateFormat = DateFormat("dd.MM.yyyy");

      for (int i = 0; i < list.length; i++) {
        list[i]['date'] = dateFormat.format(DateTime.parse(list[i]['date']));
        list[i]['warranty'] = dateFormat.format(DateTime.parse(list[i]['warranty']));
      }
    });

    //print(list[0]['id']);
    //print(data.body.toString());
  }

  _readData1() async {
    await DefaultAssetBundle.of(context).loadString("json/test.json").then((s) {
      setState(() {
        list = json.decode(s);
      });
    });
  }

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/recent.json").then((s) {
      setState(() {
        print(list);
        //list = json.decode(s);
      });
    });
  }

/*  _typecheckup(List list){
    for(int i = 0; i < list.length;i++){
      if (list[i]['flag'] == "1"){
        flag = false;
      }
    }
  }
*/
  @override
  void initState(){
    _readData();
    _test();
    super.initState();
  }

  String name = 'Серегей Басыров!';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30,),
        child: Column(
          children:  <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25), //отступ для добро пожаловать
              child: Row(
                children : [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Добро пожаловать,",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            decoration: TextDecoration.none
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Серегей Басыров!",
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.none
                        ),
                      ),

                    ],
                  ),
                  Expanded(child: Container()),
                  IconButton(onPressed: (){Get.to(()=>AuthScreen());},icon : Icon(Icons.exit_to_app_outlined), color: Colors.orangeAccent,)


              ],

            ),
      ),
            SizedBox(height: 30,),
            Container(
              height: 70,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: 3,
                  itemBuilder: (_, i){
                    return GestureDetector(
                      onTap: (){
                        if(i == 0) {
                          _readData();
                        }
                        if(i == 1) {
                          _readData1();
                        }
                      },
                      //поменять на вертикальные

                      child: Container(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        height: 220,
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: mainColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(17.0),
                                child:Row(
                                  children: [
                                    Text(
                                      filters[i],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:Colors.white
                                      ),
                                    ),
                                    //Expanded(child: Container())
                                  ],
                                )
                            ),
                            //Container(
                              //width: width,
                              //child: Text(
                                //'text',
                                //style: TextStyle(
                                    //fontSize: 20,
                                    //color:Color(0xFFb8eefc)
                                //),
                              //),
                            //),
                          ],

                        ),
                      ),


                    );
                  }),
            ),
            SizedBox(height: 20), 
            Padding(padding: const EdgeInsets.only(left: 35, right: 50), child: _buildTextField(searchController, Icons.search, 'Поиск'),),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0; i < list.length; i++)
                    Container(
                        height: 230,
                        //padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.only( left: 40,right: 30,top: 30),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed("/detail/", arguments: {
                              'name': list[i]['model'].toString(),
                              'text': list[i]['location'].toString(),
                              'status': list[i]['idSensorStatus'].toString(),
                              'indications': list[i]['value'].toString(),
                              'Date': list[i]['warranty'].toString(),
                              'model': list[i]['model'].toString(),
                              'guarantee': list[i]['date'].toString()
                            });
                          },


                          child: Container(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            height: 220,
                            width: MediaQuery.of(context).size.width-20,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                    child:Row(
                                      children: [
                                        Text(
                                          list[i]['model'],
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black

                                          ),
                                        ),
                                        //Expanded(child: Container())
                                      ],
                                    )
                                ),
                                //SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    list[i]['location'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                    child:Row(
                                      children: [
                                        Text(
                                          'Состояние',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black

                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          list[i]['idSensorStatus'].toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: mainColor,

                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                SizedBox(height: 30,),
                                Container(
                                    child:Row(
                                      children: [
                                        Text(
                                          'Текущие показания',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black

                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          list[i]['value'].toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor,

                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                SizedBox(height: 30,),
                                Container(
                                    child:Row(
                                      children: [
                                        Text(
                                          'Дата показания',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black,


                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          list[i]['date'],
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor,

                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                ],
              ),
            ))
    ],
    ),
      ),
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey)),


      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            icon: Icon(
              icon,
              color: mainColor,
            ),
            //prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}

/*SizedBox(height: 20),
Container(
padding: EdgeInsets.only(left: 35,right: 50),
child: Row(
children : [
_buildTextField(searchController, Icons.search, 'Поиск'),
Expanded(child: Container()),
Icon(Icons.menu_outlined, color: Colors.black,)


],
),
)

 */