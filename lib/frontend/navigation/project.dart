import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  final VoidCallback onBack;
  const Project({super.key, required this.onBack});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: onBack,
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: API.appcolor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 30,
                top: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('Projects', color: Colors.white, fontSize: 25),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildYellowBox(
                            'assets/images/completeproject.png',
                            'Active Projects',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildYellowBox(
                            'assets/images/activeproject.png',
                            'Completed Projects',
                            isWhiteBox: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Divider(color: Colors.grey[400], thickness: 0.5),
                    ExpandableSection(
                      title: 'Traffic',
                      slno: '01',
                      children: [
                        SlidingTabView(
                          tabs: ["Accepted", "Pending", "Rejected"],
                          tabViews: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),


                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[400], thickness: 0.5),
                    ExpandableSection(
                      title: 'Drishyam',
                      slno: '01',
                      children: [
                        SlidingTabView(
                          tabs: ["Accepted", "Pending", "Rejected"],
                          tabViews: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ProfileDataCard(
                                  imageUrl: "assets/images/contestant2.png",
                                  name: "Sandra Bullock",
                                  profession: "Actress",
                                  location: "Ernakulam",
                                  age: 29,
                                );
                              },
                            ),


                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[400], thickness: 0.5),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: AppButton(
              text: 'Create Project',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _buildCreateProjectModal(context),
                );
              },
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
              gradientColors: [Colors.transparent, Colors.transparent],
              borderColor: API.color6,
              borderRadius: 16,
            ),
          ),
        ],
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
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: API.subcolor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.white,
                    ),
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
                  AppText(
                    'Create Project',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
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
                  AppButton(text: "Add Talents", onPressed: () {}),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYellowBox(
    String imgurl,
    String title, {
    bool isWhiteBox = false,
  }) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: isWhiteBox ? Colors.white : API.color6,
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
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final String slno;
  final List<Widget> children;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.children,
    required this.slno,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool expanded) {
        setState(() {
          _expanded = expanded;
        });
      },
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: EdgeInsets.zero,
      title: Row(
        children: [
          AppText(widget.slno, color: Colors.white, fontSize: 24),
          SizedBox(width: 20),
          AppText(widget.title, color: Colors.white, fontSize: 24),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          SizedBox(width: 50),
          Icon(Icons.more_vert_outlined, color: Colors.white),
        ],
      ),
      children: widget.children,
    );
  }
}

class SlidingTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  final Color activeColor;
  final Color inactiveColor;
  final Color indicatorColor;

  const SlidingTabView({
    Key? key,
    required this.tabs,
    required this.tabViews,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.white,
    this.indicatorColor = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: indicatorColor,
            labelColor: activeColor,
            unselectedLabelColor: inactiveColor,
            indicatorWeight: 2,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: indicatorColor),
              insets: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            dividerColor: Colors.transparent,
            tabs: tabs
                .map(
                  (title) => Tab(
                    child: Text(title, style: const TextStyle(fontSize: 18)),
                  ),
                )
                .toList(),
          ),

          SizedBox(
            height: 400,
            child: TabBarView(
              children: tabViews.map((tab) {
                return SingleChildScrollView(child: tab);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDataCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String profession;
  final String location;
  final int age;

  const ProfileDataCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.profession,
    required this.location,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Container(
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    AppText(
                      profession,
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            AppText(
                              location,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),

                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey.shade300,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              "Age",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            AppText(
                              "$age Years",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
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
}
