import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/color.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
 
class _DetailPageState extends State<DetailPage> {
  int gottenStars=4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
             width: double.maxFinite,
             height: 350,
             decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage("assets/mountain2.jpeg"),
                fit: BoxFit.cover )
             ),
            )),
          Positioned(
            left: 10,
            top: 50,
            child: Row(
              children: [
              IconButton(onPressed: (){},
              icon: Icon(Icons.menu),
              color: Colors.white,
              )
            ],),
          ),
          Positioned(
            top: 320,
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight:Radius.circular(30)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    AppLargeText(text: "Yosemite",color: Colors.black87,size:30,),
                    AppLargeText(text: "\$ 250",color: AppColors.mainColor,size: 30,),
                  ],),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: AppColors.mainColor,),
                      SizedBox(width: 5,),
                      AppText(text: "USA, California",color: AppColors.mainColor,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                  children:[ 
                    Wrap(
                    children: 
                      List.generate(5, (index){
                        return Icon(Icons.star,color:index<gottenStars?AppColors.starColor:AppColors.textColor2);
                      }),
                  ),
                   AppText(text: "(4.0)",color: AppColors.starColor,)
                  ],),
                  SizedBox(height:20,),
                  AppLargeText(text: "People",color: Colors.black.withOpacity(0.8),size:20),
                  AppText(text: "Number of people in your group",color:AppColors.mainColor),
                  SizedBox(height: 10,),
                  Wrap(
                    children:
                      List.generate(5, (index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            child: AppButtons(
                              color:selectedIndex==index? Colors.white:Colors.black, 
                              size: 50,
                              backgroundColor:selectedIndex==index?Colors.black: AppColors.buttonBackground,
                              borderColor:selectedIndex==index?Colors.black: AppColors.buttonBackground,
                              text: (index+1).toString(),             
                              ),
                          ),
                        );
                      }),
                  ),
                  SizedBox(height: 20,),
                  AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                  SizedBox(height: 10,),
                  AppText(text: "You must go for a travel. Travelling helps get rid of pressure.Go to the mountains to see the nature.",color: AppColors.mainTextColor,)
                ],
              ),
            )),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children:[
              AppButtons(
              color: AppColors.textColor1,
              size: 55,
              backgroundColor: Colors.white,
              borderColor: AppColors.textColor2,
              isIcon: true,
              icon:Icons.favorite_border
              ),
              SizedBox(width: 20,),
              
            ]
            ),
          )
          ],
        ),
        ),
    );
  }
}