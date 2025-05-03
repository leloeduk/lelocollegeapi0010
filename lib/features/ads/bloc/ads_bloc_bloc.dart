// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import 'ads_bloc_event.dart';
// import 'ads_bloc_state.dart';

// class AdsBloc extends Bloc<AdsEvent, AdsState> {
//   // IDs des publicités
//   static const String interstitialAdId =
//       'ca-app-pub-6254574600116962/5647807293';
//   static const String rewardedAdId = 'ca-app-pub-6254574600116962/6646397845';
//   static const String bannerAdId = 'ca-app-pub-6254574600116962/8446953345';

//   InterstitialAd? _interstitialAd;
//   RewardedAd? _rewardedAd;
//   BannerAd? _bannerAd;
//   int _userActionCount = 0;

//   AdsBloc() : super(AdsInitial()) {
//     on<InitializeAds>(_initializeAds);
//     on<ShowInterstitialAd>(_showInterstitialAd);
//     on<ShowRewardedAd>(_showRewardedAd);
//     on<LoadBannerAd>(_loadBannerAd);
//     on<UserPerformedAction>(_trackUserAction);

//     add(InitializeAds());
//   }

//   Future<void> _initializeAds(
//     InitializeAds event,
//     Emitter<AdsState> emit,
//   ) async {
//     await MobileAds.instance.initialize();
//     _loadInterstitialAd();
//     _loadRewardedAd();
//     emit(AdsInitialized());
//   }

//   Future<void> _loadInterstitialAd() async {
//     await InterstitialAd.load(
//       adUnitId: interstitialAdId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           _interstitialAd = ad;
//           _setupInterstitialCallbacks();
//         },
//         onAdFailedToLoad: (error) {
//           _interstitialAd = null;
//         },
//       ),
//     );
//   }

//   Future<void> _loadRewardedAd() async {
//     await RewardedAd.load(
//       adUnitId: rewardedAdId,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (ad) {
//           _rewardedAd = ad;
//           _setupRewardedCallbacks();
//         },
//         onAdFailedToLoad: (error) {
//           _rewardedAd = null;
//         },
//       ),
//     );
//   }

//   Future<void> _loadBannerAd(LoadBannerAd event, Emitter<AdsState> emit) async {
//     _bannerAd = BannerAd(
//       size: event.size,
//       adUnitId: bannerAdId,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (_) => emit(BannerAdLoaded()),
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//           emit(BannerAdFailedToLoad(error.toString()));
//         },
//       ),
//     );
//     await _bannerAd!.load();
//   }

//   void _setupInterstitialCallbacks() {
//     _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (ad) {
//         ad.dispose();
//         _loadInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         ad.dispose();
//         _loadInterstitialAd();
//       },
//     );
//   }

//   void _setupRewardedCallbacks() {
//     _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (ad) {
//         ad.dispose();
//         _loadRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         ad.dispose();
//         _loadRewardedAd();
//       },
//     );
//   }

//   void _showInterstitialAd(ShowInterstitialAd event, Emitter<AdsState> emit) {
//     if (_interstitialAd != null) {
//       _interstitialAd!.show();
//       emit(InterstitialAdShown());
//     } else {
//       emit(AdFailedToShow('Interstitial ad not ready'));
//     }
//   }

//   void _showRewardedAd(ShowRewardedAd event, Emitter<AdsState> emit) {
//     if (_rewardedAd != null) {
//       _rewardedAd!.show(
//         onUserEarnedReward: (ad, reward) {
//           emit(RewardEarned(reward.amount.toInt(), reward.type));
//         },
//       );
//       emit(RewardedAdShown());
//     } else {
//       emit(AdFailedToShow('Rewarded ad not ready'));
//     }
//   }

//   void _trackUserAction(UserPerformedAction event, Emitter<AdsState> emit) {
//     _userActionCount++;
//     if (_userActionCount % 3 == 0) {
//       // Affiche une pub tous les 3 clics
//       add(ShowInterstitialAd());
//     }
//   }

//   @override
//   Future<void> close() {
//     _interstitialAd?.dispose();
//     _rewardedAd?.dispose();
//     _bannerAd?.dispose();
//     return super.close();
//   }
// }
