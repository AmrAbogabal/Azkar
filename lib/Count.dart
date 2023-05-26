import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cash.dart';
import 'Home.dart';
class Count extends StatefulWidget {
  Count({required this.indexx ,required this.Ad,required this.co});
  int indexx ;
  List<String> Ad ;
  List<String> co ;
  @override
  State<Count> createState() => _CountState(Ad:Ad, indexx: indexx, co: co);
}

class _CountState extends State<Count> {
  _CountState({required this.indexx ,required this.Ad,required this.co});
  int indexx ;
  List<String> Ad ;
  List<String> co ;
  int Count = 0 ;
  @override
  int pos = 0 ;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding:  EdgeInsets.all(50.0),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white54),
            child: Column(children: [
              Row(children: [
                const SizedBox(width: 10,),
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }, icon: const Icon(Icons.arrow_back,size: 50,color: Colors.black,)),
                Spacer(),
                const Text("المسبحة الالكترونية",style: TextStyle(color: Colors.black,fontSize: 50),),
                Spacer(),
                IconButton(onPressed: (){
                  setState((){
                    pos = 0 ;
                    co[indexx] = "0" ;
                    CacheHelper.putS(key: "Ad", Li: Ad);
                    CacheHelper.putS(key: "Co", Li: co);
                  });
                }, icon: const Icon(Icons.refresh,size: 50,color: Colors.black,)),
                SizedBox(width: 10,),
              ],),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 140,),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text("${Ad[indexx]}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20,),
                      CircleAvatar(
                        backgroundColor: Colors.white,radius: 150,
                        child:Text("${co[indexx]}",style: const TextStyle(fontSize: 80,color: Colors.black),),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(onPressed: () {
                            if(int.parse(co[indexx])>0){
                              pos = int.parse(co[indexx]) ;
                              setState((){
                                pos = pos-1 ;
                                co[indexx] = "$pos" ;

                              });
                            }
                          },
                            child: const CircleAvatar(
                              backgroundColor: Colors.redAccent,radius: 40,
                            ),),
                          // const SizedBox(width: 20,),
                          MaterialButton(onPressed: () {
                            pos= int.parse(co[indexx]) ;
                            setState((){
                              pos = pos+1 ;
                              co[indexx] = "$pos" ;
                            });
                            CacheHelper.putS(key: "Ad", Li: Ad);
                            CacheHelper.putS(key: "Count", Li: co);
                          },
                            child: const CircleAvatar(
                              backgroundColor: Colors.green,radius: 70,
                            ),),
                        ],),
                    ],),
                ),
              ),
            ],)
        ),
      ),
    );
  }
}
