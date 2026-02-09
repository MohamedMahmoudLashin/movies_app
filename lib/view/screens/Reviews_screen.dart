import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: CustomAppBar(toolTipMessage:'a',angle:0,title: 'Details', sufIcon: Icon(Icons.add_box_outlined,color: AppColor.textWhite,)),
      body: SafeArea(
        child: SingleChildScrollView(   // لو عايز scroll لما الشاشة طويلة
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/popcorn_1.png', height: 250, width: double.infinity, fit: BoxFit.cover),
                  Positioned(
                    bottom: -30,
                    left: 20,
                    child: Image.asset('assets/popcorn_1.png', height: 120),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Spiderman No Way Home', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        SizedBox(width: 4),
                        Text('2021'),
                        SizedBox(width: 12),
                        Icon(Icons.access_time, size: 16),
                        SizedBox(width: 4),
                        Text('148 Minutes'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              /// 3️⃣ Tabs Section
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                    dividerColor: AppColor.backGround,
                      isScrollable: true,
                      indicatorColor: AppColor.selectInd,
                      indicatorWeight: 5,
                      labelColor: AppColor.textWhite,
                      unselectedLabelColor: AppColor.iconHint,
                      tabs: const [
                        Tab(text: 'About Movie'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'Cast'),
                      ],
                    ),
                    SizedBox(
                      height: 150,   // المحتوى تحت التابات
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('About Movie Content...'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Reviews Content...'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Cast Content...'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// 4️⃣ Description (ممكن تحطه جوه الـ TabBarView أو خارجه)
              // Padding(
              //   padding: EdgeInsets.all(16),
              //   child: Text('Full description here...'),
              // ),

            ],
          ),
        ),
      ),
    );

  }
}
