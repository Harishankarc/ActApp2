import 'package:actapp/backend/api.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:video_player/video_player.dart';

class TalentProfile extends StatefulWidget {
  const TalentProfile({super.key});

  @override
  State<TalentProfile> createState() => _TalentProfileState();
}

class _TalentProfileState extends State<TalentProfile> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _current = 0;

  bool _isAccepted = false;

  String? _selectedCategory = 'item1';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  bool isOnline = false;
  bool isOffline = false;

  TextEditingController descriptionController = TextEditingController();

  final List<String> imgList = [
    "assets/images/contestant2.png",
    "assets/images/contestant3.png",
    "assets/images/contestant4.png",
    "assets/images/contestant2.png",
    "assets/images/contestant2.png",
    "assets/images/contestant2.png",
    "assets/images/contestant2.png",
    "assets/images/contestant2.png",
  ];
  final List<String> videoList = [
    "assets/images/colorvideo.mp4",
    "assets/images/colorvideo.mp4",
    "assets/images/colorvideo.mp4",
    "assets/images/video2.mp4",
  ];
  final List<String> multiList = ['item1', 'item2', 'item3', 'item4', 'item5'];
  List<String> _selectedMultiList = [];
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: API.appcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  top: 10,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: 500,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: imgList.map((item) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            );
                          }).toList(),
                        ),
                        // Positioned Dots inside image
                        Positioned(
                          bottom: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3.0,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == entry.key
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.4),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _isAccepted
                              ? 'assets/images/video2.png'
                              : 'assets/images/video.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 40),
                        Image.asset(
                          _isAccepted
                              ? 'assets/images/call2.png'
                              : 'assets/images/call.png',
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Sandra Bullock',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            SizedBox(height: 2),
                            AppText(
                              'Actress / Model',
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Icon(isLiked ?  Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.green : Colors.white, size: 40)),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "Location ",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            AppText(
                              "Ernakulam",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "Age ",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            AppText(
                              "29 Years",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey[400], thickness: 0.5),
              ),
              ExpandableSection(
                title: "Personal Information",
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.smalltitle(
                              'Skills',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildMultiSelect<String>(
                              items: multiList,
                              version2: true,
                              selectedItems: _selectedMultiList,
                              hintText: 'Sports',
                              onConfirm: (values) {
                                setState(() {
                                  _selectedMultiList = values;
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
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Hair Color',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Eye Color',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Chest Size',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Chest Size',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Hips',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Hips',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Waist',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Waist',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Dress Size',
                              selectedItem: _selectedCategory,
                              version2: true,
                              onChanged: (val) {
                                setState(() {
                                  _selectedCategory = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey[400], thickness: 0.5),
              ),
              ExpandableSection(
                title: "Basic Information",
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.smalltitle(
                              'Stage / Screen Name',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Stage / Screen Name',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Gender',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Gender',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Preffered Pronoun',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Preffered Pronoun',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                                    'Height *',
                                    weight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 5),
                                  API.buildDropdown(
                                    items: ['item1', 'item2'],
                                    hintText: 'Select Height',
                                    selectedItem: _selectedCategory,
                                    version2: true,
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
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 5),
                                  API.buildDropdown(
                                    items: ['item1', 'item2'],
                                    hintText: 'Select Weight',
                                    selectedItem: _selectedCategory,
                                    version2: true,
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
                              'Ethnicity',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Ethnicity',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              'Complexion',
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Complexion',
                              selectedItem: _selectedCategory,
                              version2: true,
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
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            API.buildDropdown(
                              items: ['item1', 'item2'],
                              hintText: 'Select Body Type',
                              selectedItem: _selectedCategory,
                              version2: true,
                              onChanged: (val) {
                                setState(() {
                                  _selectedCategory = val;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey[400], thickness: 0.5),
              ),
              ExpandableSection(
                title: "Photos",
                children: [RandomMediaGrid(data: imgList)],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey[400], thickness: 0.5),
              ),
              ExpandableSection(
                title: "Videos",
                children: [RandomMediaGrid(data: videoList)],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey[400], thickness: 0.5),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                  text: _isAccepted
                      ? "Invitattion Accepted"
                      : "Send Invitation",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => _buildCreateProjectModal(context),
                    );

                  },
                  borderRadius: 16,
                ),
              ),
              SizedBox(height: 20),
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
      child: StatefulBuilder(
        builder: (context, setStateDialog) {
          return Padding(
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
                        'Send Invitation',
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      AppTextFeild(hintText: 'Production House Name'),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 20),
                                    SizedBox(width: 5),
                                    AppText(
                                      'Date',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                API.dateField(
                                  'Date',
                                  'Select Date',
                                  context,
                                  (val) {
                                    setState(() {
                                      selectedDate = val;
                                    });
                                  },
                                  (val) => val == null
                                      ? ""
                                      : DateFormat("dd/MM/yyyy").format(val),
                                  selectedDate,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 20),
                                    SizedBox(width: 5),
                                    AppText(
                                      'Time',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                API.timeField(
                                  "Start Time",
                                  "Select a time",
                                  context,
                                  (val) => setState(() => selectedTime = val),
                                  (val) =>
                                      val == null ? "" : val.format(context),
                                  selectedTime,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          API.checkBoxField("Online", isOnline, (val) {
                            setStateDialog(() {
                              isOnline = val ?? false;
                              if (isOnline) isOffline = false;
                            });
                          }),
                          API.checkBoxField("Offline", isOffline, (val) {
                            setStateDialog(() {
                              isOffline = val ?? false;
                              if (isOffline) isOnline = false;
                            });
                          }),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        'Offline Place',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      AppTextFeild(hintText: 'Location'),
                      const SizedBox(height: 20),
                      AppText(
                        'Short Description',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      API.descriptionBox(hint: 'Add Description', controller: descriptionController),
                      const SizedBox(height: 50),
                      AppButton(text: "Send Invitation", onPressed: () {
                        setState(() {
                            _isAccepted = !_isAccepted;
                          });
                        Navigator.pop(context);
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.children,
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
      title: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: AppText(widget.title, color: Colors.white, fontSize: 24),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _expanded
                ? SizedBox.shrink()
                : AppText(
                    "See All",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
            SizedBox(width: 5),
            Icon(
              _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
      children: widget.children,
    );
  }
}

class RandomMediaGrid extends StatefulWidget {
  final List<String> data;

  const RandomMediaGrid({super.key, required this.data});

  @override
  State<RandomMediaGrid> createState() => _RandomMediaGridState();
}

class _RandomMediaGridState extends State<RandomMediaGrid> {
  final Map<String, Future<String?>> _thumbnailCache = {};

  bool _isVideo(String path) {
    return path.endsWith(".mp4") ||
        path.endsWith(".mov") ||
        path.endsWith(".avi");
  }

  Future<String?> _generateThumbnail(String videoPath) async {
    if (_thumbnailCache.containsKey(videoPath)) {
      return _thumbnailCache[videoPath]!;
    }

    final future = () async {
      final byteData = await rootBundle.load(videoPath);
      final tempDir = await getTemporaryDirectory();
      final tempVideo = File("${tempDir.path}/${videoPath.split('/').last}");
      if (!await tempVideo.exists()) {
        await tempVideo.writeAsBytes(
          byteData.buffer.asUint8List(
            byteData.offsetInBytes,
            byteData.lengthInBytes,
          ),
        );
      }

      return await VideoThumbnail.thumbnailFile(
        video: tempVideo.path,
        thumbnailPath: tempDir.path,
        imageFormat: ImageFormat.PNG,
        maxWidth: 200,
        quality: 75,
      );
    }();

    _thumbnailCache[videoPath] = future;
    return future;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
      child: SizedBox(
        height: 530,
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: widget.data.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final path = widget.data[index];

            if (_isVideo(path)) {
              return FutureBuilder<String?>(
                future: _generateThumbnail(path),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Icon(Icons.broken_image, size: 50);
                  }

                  return GestureDetector(
                    onTap: () {
                      slideRightWidget(
                        newPage: VideoPlayerPage(videoPath: path),
                        context: context,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(snapshot.data!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return GestureDetector(
                onTap: () {
                  slideRightWidget(
                    newPage: FullImagePage(imagePath: path),
                    context: context,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(path, fit: BoxFit.cover),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class FullImagePage extends StatelessWidget {
  final String imagePath;

  const FullImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoPath;

  const VideoPlayerPage({super.key, required this.videoPath});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    if (widget.videoPath.startsWith("assets/")) {
      _controller = VideoPlayerController.asset(widget.videoPath);
    } else {
      _controller = VideoPlayerController.file(File(widget.videoPath));
    }

    _controller.initialize().then((_) {
      setState(() {
        _isInitialized = true;
      });
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: _isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: _isInitialized
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
