import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:score_volei/widgets/team_button.dart';

import 'widgets/new_game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstTeam = 0;
  int secondTeam = 0;

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TeamButton(
                      color: Colors.grey,
                      points: firstTeam,
                      teamName: "Time A",
                      incrementScore: incrementFirstTeamScore,
                      decrementScore: decrementFirstTeamScore,
                    ),
                    const SizedBox(width: 20),
                    NewGameButton(
                      reset: reset,
                    ),
                    const SizedBox(width: 20),
                    TeamButton(
                      color: Colors.red,
                      points: secondTeam,
                      teamName: "Time B",
                      incrementScore: incrementSecondTeamScore,
                      decrementScore: decrementSecondTeamScore,
                    ),
                  ],
                ),
              ),
              _bannerAd != null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: AdWidget(ad: _bannerAd!),
                    )
                  : Container(color: Colors.red, width: 50, height: 50),
            ]),
      ),
    );
  }

  incrementFirstTeamScore() {
    setState(() {
      firstTeam++;
    });
  }

  incrementSecondTeamScore() {
    setState(() {
      secondTeam++;
    });
  }

  decrementFirstTeamScore() {
    setState(() {
      firstTeam--;
    });
  }

  decrementSecondTeamScore() {
    setState(() {
      secondTeam--;
    });
  }

  reset() {
    setState(() {
      firstTeam = 0;
      secondTeam = 0;
    });
  }

  void loadAd() {
    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-6198660940043415/1144942851'
        : 'ca-app-pub-3940256099942544/2934735716';
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('$ad failedToLoad: $error');
        },
        onAdOpened: (ad) => debugPrint('$ad onAdOpened.'),
        onAdClosed: (ad) => debugPrint('$ad onAdClosed.'),
        onAdImpression: (ad) => debugPrint('$ad impression occurred.'),
      ),
    )..load();
  }
}
