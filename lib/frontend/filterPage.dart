import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? _selectedCategory = 'item1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
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
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.slidersVertical,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        AppText('Filters', color: Colors.white, fontSize: 25),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Category',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Category',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Age',
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              API.buildDropdown(
                                items: ['item1', 'item2'],
                                hintText: 'Select Age',
                                selectedItem: _selectedCategory,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCategory = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'State',
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              API.buildDropdown(
                                items: ['item1', 'item2'],
                                hintText: 'Select State',
                                selectedItem: _selectedCategory,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCategory = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Height *',
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              API.buildDropdown(
                                items: ['item1', 'item2'],
                                hintText: 'Select Height',
                                selectedItem: _selectedCategory,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCategory = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Weight *',
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              API.buildDropdown(
                                items: ['item1', 'item2'],
                                hintText: 'Select Weight',
                                selectedItem: _selectedCategory,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCategory = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Experience',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Experience',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Body Type',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Body Type',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Hair Color',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Hair Color',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Eye Color',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Eye Color',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.smalltitle(
                          'Dress Size',
                          weight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        API.buildDropdown(
                          items: ['item1', 'item2'],
                          hintText: 'Select Dress Size',
                          selectedItem: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    AppButton(text: "Search", onPressed: () {}),
                    SizedBox(height: 20),
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
