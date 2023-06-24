import 'package:flutter/material.dart';
import 'package:travel_app/misc/color.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    'travel.png',
    'brown.jpg',
    'mount1.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(     
        scrollDirection: Axis.vertical, 
        itemCount: images.length,     //slider up n down
        itemBuilder:(_,index){
          return Container(
            width:double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/"+images[index]),
                fit: BoxFit.cover,
                ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150,left: 30,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   AppLargeText(text: 'Trips',size: 40,),
                   AppText(text: 'Mountain',size: 40,),
                   SizedBox(height: 20,),
                   Container(
                    width: 250,
                    child:AppText(
                      color: AppColors.textColor2,
                      text:'Mountain hike gives you an incredible sense of freedom a along with endurance tests.'),
                   ),
                  SizedBox(height: 20,),
                  Container(
                      width: 200,
                      child: Row(children:[ 
                       Container(
                        width: 170,
                        height: 60,
                        padding: EdgeInsets.all(7),
                         child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textColor2, // background (button) color// foreground (text) color
                          ),
                          onPressed: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),);
                          }, icon: Icon(Icons.arrow_circle_right_outlined,size: 30,color: Colors.white60,),
                          label: Text("Get started",style: TextStyle(fontSize: 16),),
                          
                          ),
                       ),
                        ])),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 3),
                      width: 8,
                      height: index==indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                      ),
                    );
                  }),
                )
              ]),
            ),
            
          );
        }),
    );
  }
}