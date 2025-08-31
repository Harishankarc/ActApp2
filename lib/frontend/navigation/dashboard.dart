import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String selected = 'Actors';
  final List<Map<String, dynamic>> options = [
    {"title": "Actors", "icon": Icons.theater_comedy},
    {"title": "Content Creators", "icon": Icons.description},
    {"title": "Models", "icon": Icons.favorite},
    {"title": "Singers", "icon": Icons.music_note},
    {"title": "Junior Artists", "icon": Icons.people},
    {"title": "Dubbing Artist", "icon": Icons.mic},
    {"title": "Crew", "icon": Icons.movie_creation_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24, backgroundColor: Colors.grey),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppText(
                        "Movie Director",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      AppText(
                        "Director",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 28,
                      ),
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...options.map(
                    (opt) => _buildOptionBox(
                      opt["title"],
                      opt["icon"],
                      selected == opt["title"],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              AppText('Dashboard', color: Colors.white, fontSize: 25),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildYellowBox(
                      'assets/images/completeproject.png',
                      '05 Active Projects',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildYellowBox(
                      'assets/images/activeproject.png',
                      '08 Completed Projects',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AppText('Upcoming Castings', color: Colors.white, fontSize: 25),
              SizedBox(
                height: 340,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildUpcomingCastingBox(),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(height: 5),
              AppButton(
                text: 'Create Project',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => _buildCreateProjectModal(context),
                  );
                },
                textStyle: TextStyle(color: Colors.white,fontSize: 16),
                gradientColors: [Colors.transparent, Colors.transparent],
                borderColor: API.color6,
                borderRadius: 16,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateProjectModal(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                      color: API.subcolor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AppText('Create Project', color: Colors.black, fontSize: 25,fontWeight: FontWeight.w600,),
                  const SizedBox(height: 30),
                  AppText(
                    'Project Name',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  AppTextFeild(hintText: 'Project Name'),
                  const SizedBox(height: 20),
                  AppText(
                    'Production House Name',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  AppTextFeild(hintText: 'Production House Name'),
                  const SizedBox(height: 50),
                  AppButton(
                    text: "Add Talents",
                    onPressed: () {

                    },
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingCastingBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/contestant.png",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project name",
                  style: TextStyle(fontSize: 12, color: API.subcolor),
                ),
                SizedBox(height: 5),
                Text(
                  "Sandra Bullock",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Actress",
                  style: TextStyle(fontSize: 12, color: API.subcolor),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.check, color: Colors.black, size: 20),
              ),
              const SizedBox(height: 6),

              const Text(
                "Today : 3.30am",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYellowBox(String imgurl, String title) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: API.color6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(imgurl, height: 50, width: 50),
          const Spacer(),
          AppText(
            title,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionBox(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = title;
        });
      },
      child: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade600, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 25,
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            AppText(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
