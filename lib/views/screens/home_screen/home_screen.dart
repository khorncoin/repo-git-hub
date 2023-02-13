import 'package:flutter/material.dart';
import 'package:luna/utils/constants/app_colors.dart';
import 'package:luna/utils/constants/app_font_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants/app_images.dart';
import '../../widgets/banner_slider.dart';
import '../notification/notification_screen/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var listBanner = [
    {
      "id":1,
      "image":""
    },
    {
      "id":2,
      "image":""
    },
    {
      "id":3,
      "image":""
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary,
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.px),

                height: 40,
                child: Center(
                  child: Image.asset(AppImages.logo),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 22.px,right: 18.px),
                  padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 8.px),

                  decoration: BoxDecoration(
                      border: Border.all(width: .2,color: AppColors().grey),
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search...",style: AppFontStyle().textM(color: AppColors().grey),),
                        Icon(Icons.search,size: 20,color: AppColors().grey,)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5.px),

                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, NotificationScreen.routeName);
                  },
                  child: Center(
                    child: Icon(Icons.notifications_none_outlined,size: 30,color: AppColors().white,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors().white,
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        color: AppColors().primary,
                      ),
                      Container(
                        height: 110,
                        color: AppColors().white,
                      ),
                    ],
                  ),
                  Positioned(
                      top: 15,
                      right: 0,
                      left: 0,
                      child: BannerSlider(listBanner: listBanner,)

                  ),
                ],
              ),


              Container(
                color: AppColors().white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categories",style: AppFontStyle().titleM(),),
                          Text("See all",style: AppFontStyle().textM(),),

                        ],
                      ),
                    ),
                    Container(
                      height: 200,

                      margin: EdgeInsets.symmetric(horizontal: 18.px,vertical: 18.px),
                      padding: EdgeInsets.symmetric(vertical: 20.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors().white,
                        boxShadow: [
                          BoxShadow(color: AppColors().grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                        ]
                      ),
                      child: GridView.count(
                          crossAxisCount: 3,
                        childAspectRatio:1.30,

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(6, (index) => _buildCategoryItem()),
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Promotions",style: AppFontStyle().titleM(),),
                          Text("See all",style: AppFontStyle().textM(),),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.px,bottom: 20.px),
                      height: MediaQuery.of(context).size.width/2.2.px,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return _buildPromotionItem();
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shops",style: AppFontStyle().titleM(),),
                          Text("See all",style: AppFontStyle().textM(),),

                        ],
                      ),
                    ),
                    Container(
                      height: 280,

                      margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 1.px),
                      padding: EdgeInsets.symmetric(vertical: 20.px),

                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio:1.10,


                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(6, (index) => _buildShopItem()),
                      ),

                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _buildCategoryItem(){
    return Column(
      children: const [
        Icon(Icons.local_printshop_outlined,size: 40,),
        Text("Food")
      ],
    );
  }
  _buildShopItem(){
    return Column(
      children:  [
        Container(
            margin: EdgeInsets.all(10.px),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors().white,
                boxShadow: [
                  BoxShadow(color: AppColors().grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                ]
            ),
            child: Icon(Icons.local_printshop_outlined,size: 40,)),
        Text("Shop")
      ],
    );
  }

  _buildPromotionItem(){
    return Container(
      margin: EdgeInsets.only(right: 15.px),
      height: 30,
      width: MediaQuery.of(context).size.width/1.3,
      decoration: BoxDecoration(
        color: AppColors().green,
        borderRadius: BorderRadius.circular(8)
      ),
      
    );
  }
}
