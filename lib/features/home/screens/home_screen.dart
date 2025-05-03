import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/utils/app_colors.dart';
import '../../class/screens/class_matiere_screen.dart';
import '../../document/screens/document_screen.dart';
import '../../homework/screens/homework_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': '6ème',
      'color': Colors.green[900]!,
      'icon': Icons.school,
      'screen': ClassMatiereScreen(className: '6eme'),
    },
    {
      'title': '5ème',
      'color': Colors.yellow[900]!,
      'icon': Icons.school,
      'screen': ClassMatiereScreen(className: '5eme'),
    },
    {
      'title': '4ème',
      'color': Colors.grey[900]!,
      'icon': Icons.school,
      'screen': ClassMatiereScreen(className: '4eme'),
    },
    {
      'title': '3ème',
      'color': Colors.red[900]!,
      'icon': Icons.school,
      'screen': ClassMatiereScreen(className: '3eme'),
    },
    {
      'title': 'Devoirs',
      'color': Colors.blue[900]!,
      'icon': Icons.assignment,
      'screen': HomeworkScreen(),
    },
    {
      'title': 'Documents',
      'color': Colors.purple[900]!,
      'icon': Icons.library_books,
      'screen': const DocumentScreen(),
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children:
                  menuItems
                      .map((item) => _buildMenuCard(context, item))
                      .toList(),
            ),
          ),
        ],
      ),
      // floatingActionButton: BlocBuilder<AdsBloc, AdsState>(
      //   builder: (context, state) {
      //     if (state is BannerAdLoaded) {
      //       return SizedBox(
      //         width: state.bannerAd.size.width.toDouble(),
      //         height: state.bannerAd.size.height.toDouble(),
      //         child: ConstrainedBox(
      //           constraints: BoxConstraints(
      //             minWidth: state.bannerAd.size.width.toDouble(),
      //             maxWidth: state.bannerAd.size.width.toDouble(),
      //             minHeight: state.bannerAd.size.height.toDouble(),
      //             maxHeight: state.bannerAd.size.height.toDouble(),
      //           ),
      //           child: AdWidget(ad: state.bannerAd),
      //         ),
      //       );
      //     }
      //     return const SizedBox(height: 50);
      //   },
      // ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade900, AppColors.secondaryGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 20,
            child: Image.asset("assets/images/logo.png", width: 120),
          ),
          const Positioned(
            right: 20,
            top: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "LELO COLLÈGE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Plateforme éducative complète\npour élèves et enseignants",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(context, Map<String, dynamic> item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: item['color'],
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap:
            () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => item['screen'])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'], size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
