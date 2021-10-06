import 'package:flutter/material.dart';
import 'package:gassmen/constans.dart';
import 'package:gassmen/main.dart';
import 'package:get/get.dart';
import 'package:flutter_echarts/flutter_echarts.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List test = [50,100,150,200,250,300,175];
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(Get.arguments['name'],style: TextStyle(color: Colors.black, fontSize: 25),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.clear),color: mainColor,),
          ),
        ],
      ),
      body: Container(
        child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Center(
                      child: Echarts(
                        option: '''
                         {
                        tooltip: {
                          trigger: 'axis',
                          axisPointer: {
                            type: 'shadow'
                          }
                        },
                        grid: {
                          left: '3%',
                          right: '4%',
                          bottom: '3%',
                          containLabel: true
                        },
                        xAxis: [
                          {
                            type: 'category',
                            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                            axisTick: {
                              alignWithLabel: true
                            }
                          }
                        ],
                        yAxis: [
                          {
                            type: 'value'
                          }
                        ],
                        series: [
                          {
                            name: 'Direct',
                            type: 'bar',
                            barWidth: '60%',
                            data: [200, 52, 200, 334, 390, 330, 220]
                          }
                        ]
                      }
                        ''',
                      ),
                    ),
                    width: 800,
                    height: 250,
                  )
              ),
              Expanded(
                flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Состояние \n датчика',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                Text(Get.arguments['status'], style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 15),),
                                VerticalDivider(
                                    thickness: 2,
                                    width: 15,
                                    color: Colors.grey,
                                  ),
                                Text('Текущие \n показания',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                Text(Get.arguments['indications'], style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('Модель', style: TextStyle(color: mainColor, fontSize: 21),),
                                  SizedBox(height: 5,),
                                  Text(Get.arguments['model'], style: TextStyle(color: Colors.black,fontSize: 17),)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Гарантия', style: TextStyle(color: mainColor,fontSize: 21),),
                                  SizedBox(height: 5,),
                                  Text(Get.arguments['guarantee'], style: TextStyle(color: Colors.black,fontSize: 17),)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Center(
                              child: Column(
                                  children: [
                                    Text('Дата последней проверки:', style: TextStyle(color: mainColor,fontSize: 21),),
                                    SizedBox(height: 5,),
                                    Text('12.12.2020', style: TextStyle(color: Colors.black,fontSize: 17),)
                                  ],
                              )
                          ),
                          SizedBox(height: 20,),
                          Center(
                              child: Column(
                                children: [
                                  Text('Местонахождение:', style: TextStyle(color: mainColor,fontSize: 21),),
                                  SizedBox(height: 5,),
                                  Text(Get.arguments['text'], style: TextStyle(color: Colors.black,fontSize: 17),)
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
      ),

    );
  }
}
