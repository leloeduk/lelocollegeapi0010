import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lelocollege/features/document/screens/document_screen.dart';
import 'package:lelocollege/features/settings/screens/setting_screen.dart';
import 'package:lelocollege/features/home/screens/app_screen.dart';
import 'package:lelocollege/features/homework/screens/homework_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 130,
            margin: const EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade900,
                  AppColors.secondaryGreen,
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  left: -40,
                  bottom: -10,
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: Image(
                      image: AssetImage("assets/images/3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        " Pourquoi ? ",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "LELO COLLÈGE",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          " Pour Aider \n les enseignants, élèves\n et parents d'élèves ",
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 16,
              runSpacing: 6,
              children: [
                CustomListTile(
                  title: "Accueil",
                  iconData: Icons.home,
                  onTap: () {
                    // Fermer le Drawer et naviguer vers l'écran d'accueil
                    Get.back();
                    Get.to(() => const AppScreen());
                  },
                ),
                CustomListTile(
                  title: "Documents pédagogiques",
                  iconData: Icons.book,
                  onTap: () {
                    Get.back();
                    Get.to(() => const DocumentScreen());
                  },
                ),
                CustomListTile(
                  title: "Devoirs et Examens",
                  iconData: Icons.add_home_work_outlined,
                  onTap: () {
                    Get.back();
                    Get.to(() => HomeworkScreen());
                  },
                ),
                CustomListTile(
                  title: "Mettre à jour",
                  iconData: Icons.update,
                  onTap: () {
                    Get.back();
                    _launchAppStore();
                  },
                ),
                CustomListTile(
                  title: "Partager l'application",
                  iconData: Icons.share_outlined,
                  onTap: () {
                    Get.back();
                    _shareApp();
                  },
                ),
                CustomListTile(
                  title: "Noter l'application",
                  iconData: Icons.star,
                  onTap: () {
                    Get.back();
                    _rateApp();
                  },
                ),
                CustomListTile(
                  title: "Paramètres",
                  iconData: Icons.settings,
                  onTap: () {
                    Get.back();
                    Get.to(() => const SettingScreen());
                  },
                ),
                CustomListTile(
                  title: "À propos de l'application",
                  iconData: Icons.info,
                  onTap: () {
                    Get.back();
                    _showAboutApp(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade900,
                  AppColors.secondaryGreen,
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/5.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "LELO COLLÈGE",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          " Pour la réussite \n de l'éducation ",
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _shareApp() {
    Share.share(
      'Découvrez cette application géniale ! https://your-app-link.com',
    );
  }

  void _rateApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  void _launchAppStore() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'play.google.com',
      path: 'store/apps/details',
      queryParameters: {'id': 'your.app.package'},
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showAboutApp(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: 220,
          width: double.infinity,
          child: Column(
            children: [
              Center(
                child: Text(
                  "LELO COLLÈGE \n une application éducative ",
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Pour aider les enseignants, élèves et parents d'élèves.\n Vous voulez nous contacter ?",
                style: TextStyle(color: Colors.green.shade900, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Center(
                child: TextButton.icon(
                  icon: Icon(Icons.call, color: Colors.red),
                  onPressed: () {},
                  label: Text(
                    " Cliquez ici >>> +242 06 682 63 52 ",
                    style: TextStyle(color: Colors.red.shade900, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.iconData,
    this.onTap,
  });
  final String title;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const StadiumBorder(),
      splashColor: AppColors.secondaryGreen,
      leading: Icon(iconData, color: AppColors.primaryGreen),
      title: Text(title),
      trailing: const Icon(Icons.arrow_circle_right_outlined),
      onTap: onTap,
    );
  }
}
