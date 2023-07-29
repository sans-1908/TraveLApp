import 'package:flutter/material.dart';
import 'package:travel_app/pages/navPages/balloning.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/color.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images={
     "Balloning.jpg":"Hiking",
     "Hiking.png":"Hiking",
     "Kayaking.jpg":"Kayanking",
     "Snorkling.jpg":"Snorkling",
  };
  var mountains={
   'mountain2.jpeg',
   'mount2.jpeg',
    'mount3.jpg'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController=TabController(length: 3, vsync: this);
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
        Container(
          padding: EdgeInsets.only(top: 70,left: 20),
          child: Row(children: [
            Icon(Icons.menu,size:30,color:Colors.black54),
            Expanded(child:Container()),           
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/icon.jpg")),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ]),
        ) ,
        SizedBox(height: 30,),
        //discover text
        Container(
          margin:EdgeInsets.only(left:20),
          child: AppLargeText(text: 'Discover')),
        SizedBox(height: 20,),
        //tabBar
        Container(
          child: Align(
            alignment:Alignment.centerLeft ,
            child: TabBar(
              labelPadding: EdgeInsets.only(left:20,right:20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize:TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: AppColors.mainColor,radius:4),
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ]),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage()),);
          },
          child: Container(
            padding: EdgeInsets.only(left:20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return 
                  Container(
                    margin: EdgeInsets.only(right: 15,top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image:DecorationImage(
                      image: AssetImage("assets/"+mountains.elementAt(index)),
                      fit: BoxFit.cover)
                  ),
                   );
                },
              ),
              Text('There'),
              Text('Bye'),
            ]),
          ),
        )
      ,SizedBox(height: 20,),
      Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          AppLargeText(text:"Explore more",size: 22,),
          AppText(text: "See all",color: AppColors.textColor1,)
        ],),
      ),
      SizedBox(height: 20,),
      Container(
        height: 120,
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 20),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index){
            return Container(
              margin: EdgeInsets.only(right:30 ),
              child: Column(
                children: [
                 InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Ballooning()),);
                  },
                   child: Container(
                   // margin: EdgeInsets.only(right: 50),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image:DecorationImage(
                        image: AssetImage("assets/"+images.keys.elementAt(index)),
                        fit: BoxFit.cover)
                    ),
                     ),
                 ),
                   SizedBox(height: 5,),
                 Container(
                  child: AppText(
                    text: images.values.elementAt(index),
                    size: 17,
                  color: AppColors.textColor2,),
                 )
                ],
              ),
            );
          }),
      )
      ])
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color,radius:radius);
      
  }

}
  class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
   _CirclePainter({
    required this.color,
    required this.radius
  }); 
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset=Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  } 
  }