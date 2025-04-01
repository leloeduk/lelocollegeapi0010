import 'package:flutter/material.dart';

class DataClass {
  // Contenu fictif pour chaque classe
  static final Map<String, Map<String, List<String>>> classContent = {
    '6ème': {
      'Mathématiques': ['Chapitre 1: Nombres entiers', 'Chapitre 2: Géométrie'],
      'Français': ['Chapitre 1: Grammaire', 'Chapitre 2: Lecture'],
      'Histoire-Géographie': [
        'Chapitre 1: Préhistoire',
        'Chapitre 2: Antiquité',
      ],
      'SVT': ['Chapitre 1: Le vivant', 'Chapitre 2: La planète Terre'],
      'Physique-Chimie': [
        'Chapitre 1: L\'électricité',
        'Chapitre 2: Les mélanges',
      ],
      'Technologie': [
        'Chapitre 1: Les objets techniques',
        'Chapitre 2: Les matériaux',
      ],
      'Éducation Musicale': [
        'Chapitre 1: Le rythme',
        'Chapitre 2: Les instruments',
      ],
      'Arts Plastiques': ['Chapitre 1: Le dessin', 'Chapitre 2: La couleur'],
      'EPS': ['Chapitre 1: L\'athlétisme', 'Chapitre 2: Les sports collectifs'],
      'Anglais': ['Chapitre 1: Les bases', 'Chapitre 2: La conversation'],
    },
    '5ème': {
      'Mathématiques': ['Chapitre 1: Fractions', 'Chapitre 2: Angles'],
      'Français': ['Chapitre 1: Conjugaison', 'Chapitre 2: Orthographe'],
      'Histoire-Géographie': [
        'Chapitre 1: Moyen Âge',
        'Chapitre 2: Renaissance',
      ],
      'SVT': ['Chapitre 1: La reproduction', 'Chapitre 2: Les roches'],
      'Physique-Chimie': [
        'Chapitre 1: Les forces',
        'Chapitre 2: Les transformations',
      ],
      'Technologie': [
        'Chapitre 1: Les systèmes techniques',
        'Chapitre 2: Les énergies',
      ],
      'Éducation Musicale': [
        'Chapitre 1: Les instruments à vent',
        'Chapitre 2: La composition',
      ],
      'Arts Plastiques': [
        'Chapitre 1: La perspective',
        'Chapitre 2: Les techniques mixtes',
      ],
      'EPS': ['Chapitre 1: La natation', 'Chapitre 2: Les jeux collectifs'],
      'Anglais': [
        'Chapitre 1: Les phrases complexes',
        'Chapitre 2: La communication',
      ],
    },
    '4ème': {
      'Mathématiques': ['Chapitre 1: Algèbre', 'Chapitre 2: Statistiques'],
      'Français': [
        'Chapitre 1: Analyse de texte',
        'Chapitre 2: Expression écrite',
      ],
      'Histoire-Géographie': [
        'Chapitre 1: Révolution française',
        'Chapitre 2: Empire napoléonien',
      ],
      'SVT': ['Chapitre 1: La santé', 'Chapitre 2: L\'écologie'],
      'Physique-Chimie': [
        'Chapitre 1: L\'énergie',
        'Chapitre 2: Les réactions chimiques',
      ],
      'Technologie': [
        'Chapitre 1: Les objets connectés',
        'Chapitre 2: Les matériaux innovants',
      ],
      'Éducation Musicale': [
        'Chapitre 1: Les percussions',
        'Chapitre 2: L\'harmonie',
      ],
      'Arts Plastiques': [
        'Chapitre 1: L\'art contemporain',
        'Chapitre 2: Les techniques numériques',
      ],
      'EPS': [
        'Chapitre 1: Le badminton',
        'Chapitre 2: Les activités de pleine nature',
      ],
      'Anglais': [
        'Chapitre 1: Les temps du passé',
        'Chapitre 2: La littérature',
      ],
    },
    '3ème': {
      'Mathématiques': [
        'Chapitre 1: Géométrie dans l\'espace',
        'Chapitre 2: Probabilités',
      ],
      'Français': ['Chapitre 1: Argumentation', 'Chapitre 2: Littérature'],
      'Histoire-Géographie': [
        'Chapitre 1: Guerres mondiales',
        'Chapitre 2: Décolonisation',
      ],
      'SVT': ['Chapitre 1: Le corps humain', 'Chapitre 2: Les écosystèmes'],
      'Physique-Chimie': [
        'Chapitre 1: L\'univers',
        'Chapitre 2: Les transformations de la matière',
      ],
      'Technologie': [
        'Chapitre 1: Les innovations technologiques',
        'Chapitre 2: Les énergies renouvelables',
      ],
      'Éducation Musicale': [
        'Chapitre 1: Les instruments à cordes',
        'Chapitre 2: L\'improvisation',
      ],
      'Arts Plastiques': [
        'Chapitre 1: L\'art abstrait',
        'Chapitre 2: Les installations artistiques',
      ],
      'EPS': ['Chapitre 1: Le handball', 'Chapitre 2: Les sports d\'aventure'],
      'Anglais': [
        'Chapitre 1: Les discours',
        'Chapitre 2: La culture anglophone',
      ],
    },
  };

  // Icônes pour chaque matière
  static final Map<String, IconData> subjectIcons = {
    'Mathématiques': Icons.functions,
    'Français': Icons.book,
    'Histoire-Géographie': Icons.public,
    'SVT': Icons.eco,
    'Physique-Chimie': Icons.science,
    'Technologie': Icons.build,
    'Éducation Musicale': Icons.music_note,
    'Arts Plastiques': Icons.palette,
    'EPS': Icons.sports_soccer,
    'Anglais': Icons.language,
  };
  // Contenu fictif pour les devoirs
  // Contenu fictif pour les documents
  static final List<Map<String, String>> documentsContent = [
    {
      'title': 'Guide de Mathématiques',
      'description': 'Un guide complet pour les mathématiques de 6ème.',
      'category': 'Guides',
      'cycle': 'Cycle 3',
      'class': '6ème',
      'date': '2023-10-01',
      'downloads': '150',
      'file_type': 'PDF',
      'file_url': 'url_to_pdf_file',
    },
    {
      'title': 'Livre de Français',
      'description': 'Livre au programme de français pour la 5ème.',
      'category': 'Livres au programme',
      'cycle': 'Cycle 4',
      'class': '5ème',
      'date': '2023-09-15',
      'downloads': '200',
      'file_type': 'Image',
      'file_url': 'url_to_image_file',
    },
    // Ajoutez plus de documents ici
  ];

  // Contenu fictif pour les devoirs
  static final List<Map<String, String>> homeworkContent = [
    {
      'title': 'Devoir de Mathématiques',
      'description': 'Devoir de classe de mathématiques.',
      'year': '2023',
      'subject': 'Mathématiques',
      'type': 'Devoir de classe',
      'date': '2023-10-10',
      'file_url_subject': 'url_to_subject_file',
      'file_url_correction': 'url_to_correction_file',
    },
    {
      'title': 'Composition de Français',
      'description': 'Composition départementale de français.',
      'year': '2022',
      'subject': 'Français',
      'type': 'Composition',
      'date': '2022-06-15',
      'file_url_subject': 'url_to_subject_file',
      'file_url_correction': 'url_to_correction_file',
    },
    // Ajoutez plus de devoirs ici
  ];

  // Contenu fictif pour le tiroir
  static final List<Map<String, String>> drawerContent = [
    {
      'title': 'Profil',
      'description': 'Voir et modifier les informations de profil.',
    },
    {
      'title': 'Paramètres',
      'description': 'Accéder aux paramètres de l\'application.',
    },
    {'title': 'À propos', 'description': 'Informations sur l\'application.'},
  ];

  // Contenu fictif pour les paramètres
  static final List<Map<String, String>> settingsContent = [
    {
      'title': 'Notifications',
      'description': 'Activer ou désactiver les notifications.',
    },
    {'title': 'Thème', 'description': 'Changer le thème de l\'application.'},
    {'title': 'Langue', 'description': 'Changer la langue de l\'application.'},
  ];
}
