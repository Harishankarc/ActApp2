import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Profile extends StatelessWidget {
  final VoidCallback onBack;
  const Profile({super.key, required this.onBack});

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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 30,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('My Profile', color: Colors.white, fontSize: 25),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          LucideIcons.user,
                          size: 80,
                          color: Colors.black,
                        ),
                      ),

                      Positioned(
                        bottom: -8,
                        right: -8,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              LucideIcons.squarePen,
                              size: 12,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: AppText(
                    'Director Name',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                Positioned(
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      LucideIcons.squarePen,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade400, thickness: 0.5),
            Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: AppText('Director', color: Colors.white, fontSize: 18),
                ),

                Positioned(
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      LucideIcons.squarePen,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade400, thickness: 0.5),
            SizedBox(height: 50),
            _settingTile(Icons.phone_android, "Change Phone Number", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.email, "Change Email-Id", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.lock_outline, "Privacy", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.article_outlined, "Terms & Conditions", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.info_outline, "About Us", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.support_agent, "Support", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
            _settingTile(Icons.power_settings_new, "Logout", () {}),
            Divider(color: Colors.grey.shade400, thickness: 0.5,height: 0.1,),
          ],
        ),
      ),
    );
  }

  Widget _settingTile(IconData leadingIcon, String title, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Icon(leadingIcon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: AppText(title, color: Colors.white, fontSize: 16)),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
