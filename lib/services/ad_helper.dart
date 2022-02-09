import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper extends GetxController {
  /// banner ad id
  static String get bannerAdUnitId {
    if(Platform.isAndroid){
      return 'ca-app-pub-9538373288427581/5291402934';//'ca-app-pub-3940256099942544/6300978111';//'ca-app-pub-9538373288427581/5291402934';
    }else if(Platform.isIOS){
      return 'ca-app-pub-9538373288427581/9744819118'; //'ca-app-pub-3940256099942544/2934735716';//'ca-app-pub-9538373288427581/9744819118';
    }else{
      throw UnsupportedError('Unsupported Platform');
    }
  }
  // /// interstitial ad id
  // static String get interstitialAdUnitId {
  //   if(Platform.isAndroid){
  //     return 'ca-app-pub-9538373288427581/5291402934';
  //   }else if(Platform.isIOS){
  //     return 'ca-app-pub-9538373288427581/9744819118';
  //   }else{
  //     throw UnsupportedError('Unsupported Platform');
  //   }
  // }

  /// Ads

  /// define the BannerAd variable
  late BannerAd bottomBannerAd;

  /// initialize the banner ad as not loaded
  var isBottomBannerAdLoaded = false.obs;

  /// create the banner ad
  void _createBottomBannerAd() {
    try {
      bottomBannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (_) {
            isBottomBannerAdLoaded.value = true;
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
      );
      bottomBannerAd.load();
    } on UnsupportedError {
    }
  }


  @override
  void onInit() {
    _createBottomBannerAd();
    super.onInit();
  }

  @override
  void onClose() {
    bottomBannerAd.dispose();
    super.onClose();
  }
}