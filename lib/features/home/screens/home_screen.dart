import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../class/screens/class_matiere_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> classes = [
    {'name': '6ème', 'icon': Icons.book},
    {'name': '5ème', 'icon': Icons.school},
    {'name': '4ème', 'icon': Icons.cast_for_education},
    {'name': '3ème', 'icon': Icons.science},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
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
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/1.png"),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          " C'est quoi ça ? ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 6,
                      right: 0,
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
                            "Une Application\n éducative pour aider ",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Les enseignants \n élèves et \n parents d'élèves ",
                            style: TextStyle(
                              color: Colors.green.shade900,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: [
                  BuildCard(
                    title: classes[0]['name'],
                    color: Colors.green[900]!,
                    icon: Icons.school,
                    page: ClassesMatieresChapitresPage(
                      className: classes[0]['name'],
                      currentColor: Colors.green[900]!,
                    ),
                  ),
                  BuildCard(
                    title: classes[1]['name'],
                    color: Colors.yellow[900]!,
                    icon: Icons.school,
                    page: ClassesMatieresChapitresPage(
                      className: classes[1]['name'],
                      currentColor: Colors.yellow[900]!,
                    ),
                  ),
                  BuildCard(
                    title: classes[2]['name'],
                    color: Colors.grey[900]!,
                    icon: Icons.school,
                    page: ClassesMatieresChapitresPage(
                      className: classes[2]['name'],
                      currentColor: Colors.grey[900]!,
                    ),
                  ),
                  BuildCard(
                    title: classes[3]['name'],
                    color: Colors.red[900]!,
                    icon: Icons.school,
                    page: ClassesMatieresChapitresPage(
                      className: classes[3]['name'],
                      currentColor: Colors.red[900]!,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 70,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  const BuildCard({
    required this.title,
    required this.color,
    required this.icon,
    required this.page,
    super.key,
  });

  final String title;
  final Color color;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
