import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/filterPage.dart';
import 'package:actapp/frontend/talentProfile.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Talents extends StatefulWidget {
  const Talents({super.key});

  @override
  State<Talents> createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {
    bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back, color: Colors.white, size: 30)),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: API.appcolor,

      ),
      body: Padding(
        padding: const EdgeInsets.only(left:30,right: 30,bottom: 30,top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText('Talents', color: Colors.white, fontSize: 25),
                      SizedBox(height: 2),
                      AppText(
                        '12 420 available',
                        color: API.color3,
                        fontSize: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(LucideIcons.search, color: Colors.white),
                      SizedBox(width: 30),
                      InkWell(onTap: (){
                        slideRightWidget(newPage: FilterPage(), context: context);
                      },child: Icon(LucideIcons.slidersVertical, color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              _buildContestantBox(),
              _buildContestantBox(),
              _buildContestantBox(),
              _buildContestantBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContestantBox() {
    return GestureDetector(
      onTap: (){
        slideRightWidget(newPage: TalentProfile(), context: context);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/contestant2.png",
                    width: 120,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sandra Bullock",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Actress / Model",
                                style: TextStyle(color: Colors.grey[400], fontSize: 16),
                              ),
                              const SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location ",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "Ernakulam",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Age ",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "29 Years",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),



                        ],
                      ),
                      InkWell(onTap: (){
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },child: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.green : Colors.white, size: 35)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.grey.shade600,thickness: 0.5,),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
