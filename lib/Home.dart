import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cash.dart';
import 'Count.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  int start = 0 ;
  var Do3aa = TextEditingController();
  List<String> Ad3ya = ["لا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ","سُبْحانَ اللَّهِ وبِحَمْدِهِ"," سُبْحانَ اللَّهِ العَظِيم","لا إله إلا الله","الله أكبر","لا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ","اللَّهُمَّ اغْفِرْ لِي","أستغفر الله","اللّهم إنّي أسألك في صلاتي ودعائي بركةً تطهّر بها قلبي","اللّهم َأغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ","ربَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ","اللهم صلِّ علي سيدنا محمد","الحمدُ للهِ"];
  List<String> count = ["0","0","0","0","0","0","0","0","0","0","0","0","0"];
  initState() {
    super.initState();
    print("hiiiiiiiiiiii");
    print(CacheHelper.getS(key: "Ad")!=null);
    if(CacheHelper.getS(key: "Ad")!=null){
      print("Amr");
      print(Ad3ya);
      print(count);
      print("Amr");
      print(CacheHelper.getS(key: "Ad"));
      print(CacheHelper.getS(key: "Count"));
      Ad3ya = CacheHelper.getS(key: "Ad");
      count = CacheHelper.getS(key: "Count");
      print("Amr");
      print(Ad3ya);
    }
    else {
      print("else");
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          //leading:IconButton(onPressed:(){}, icon: const Icon(Icons.notifications_on,color: Colors.white,size: 35,)),
          actions: const [
            // IconButton(onPressed:(){}, icon: const Icon(Icons.settings_applications,color: Colors.white,size: 35,))
          ],
          title: const Text(
              "تسبيح"
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: const Image(image: NetworkImage("https://cdn.pixabay.com/photo/2018/05/08/21/38/ramadan-3384043_1280.jpg"))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(color: start==0?Colors.green:Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(onPressed:(){
                        setState((){
                          start = 0;
                        });
                      },  child: const Icon(Icons.holiday_village,color: Colors.white,size: 50,))),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: start==1?Colors.green:Colors.white,),
                      child: MaterialButton(onPressed:(){
                        setState((){
                          start = 1 ;
                        });
                      },  child: const Icon(Icons.add_circle_outlined,color: Colors.white,size: 50,))),
                ],),
              const SizedBox(height: 100,),
              start==0?Scroll():Add(),
            ],),)
    );
  }
  Widget Scroll()=> ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context,index)=>Style(Ad3ya,index,count),itemCount: Ad3ya.length,shrinkWrap: true,separatorBuilder: (BuildContext context, int index)=>const SizedBox(height: 10,) ,);
  Widget Style(List<String> ad3ya,index, List<String> count)=>InkWell(
    onTap: (){
      print(index);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Count(Ad:Ad3ya, co:count, indexx: index,)),
      );
    },
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.blueAccent ),
      child: Padding(padding: EdgeInsets.all(30),
        child: Row(children: [
          CircleAvatar(backgroundColor: Colors.black,child: Text("${index+1}",style: TextStyle(color: Colors.white),),),
          SizedBox(width: 10,),
          Icon(Icons.star,color: int.parse(count[index])>1000000?Colors.yellow:Colors.black26,size: 30,),
          SizedBox(width: 20,),
          Container(width :(MediaQuery.of(context).size.width)/2,child: Text("${ad3ya[index]}",maxLines: 2,overflow:TextOverflow.clip ,style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,),)),
          Spacer(),
          CircleAvatar(backgroundColor: Colors.greenAccent,radius: 50,child: Text(count[index],style: TextStyle(color: Colors.black,fontSize: 25),),),
          // SizedBox(width: 10,),
          IconButton(onPressed: (){
            setState((){
              print(MediaQuery.of(context).size.width);
              Ad3ya.removeAt(index);
              count.removeAt(index);
              CacheHelper.putS(key: "Ad", Li: Ad3ya);
              CacheHelper.putS(key: "co", Li: count);
            });
            print("object");
            print(Ad3ya);
            print(count);
          }, icon: const Icon(Icons.remove_circle_sharp,size: 50,color: Colors.black,)),



        ],),
      ),
    ),
  );
  Widget Add()=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
          child: TextFormField(
              textAlign: TextAlign.center,
              controller: Do3aa,
              decoration: const InputDecoration(hintText: "ادخل الذكر الذى تريد اضافته",)
          ),),
        SizedBox(height: 10,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
          child: MaterialButton(onPressed: () {
            if(Do3aa.text.isEmpty){
              print("Error");
            }
            else {
              setState((){
                Ad3ya.add(Do3aa.text);
                count.add("0");
                start = 0;
                Do3aa.text = "" ;
                CacheHelper.putS(key: "Ad", Li: Ad3ya);
                CacheHelper.putS(key: "Count", Li: count);

              });
            }
          },),),
      ],),
  );
}
