import 'package:araba_sevdasi/anaMenu.dart';
import 'package:araba_sevdasi/profilListe/profil_dondur.dart';
import 'package:araba_sevdasi/profilListe/profil_liste.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

int lastToggleIndex = 1;
double leftCarPosition = 0.0;
double rightCarPosition = 0.0;

// ignore: must_be_immutable
class Profil extends StatelessWidget {
  Profil({super.key, this.indexDegistir});

  // ignore: prefer_typing_uninitialized_variables
  var indexDegistir;
  var liste = ProfilListe.profilListe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 0, 132),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 230,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 6, 2, 210),
                    Color.fromARGB(255, 110, 0, 132),
                  ],
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 170,
                  width: 170,
                  child: Image.asset("assets/images/profile/emirhoca1.png"),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  width: 431,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ProfilDondur(liste),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 20),
                        child: themeButton(),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 10),
                  curve: Curves.easeInCirc,
                  margin: EdgeInsets.only(
                      top: 396, left: leftCarPosition, right: rightCarPosition),
                  child: Image.asset(
                    'assets/images/profile/emirhoca1.png', // Araba resminin dosya yolu
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget themeButton() {
    return Row(
      children: [
        const Text(
          "Tema:",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Oswald",
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 180),
        Padding(
          padding: const EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 0),
          child: ToggleSwitch(
            minWidth: 60.0,
            minHeight: 40.0,
            initialLabelIndex: lastToggleIndex,
            cornerRadius: 30.0,
            activeFgColor: const Color.fromARGB(255, 255, 249, 249),
            inactiveBgColor: const Color.fromARGB(255, 48, 48, 48),
            inactiveFgColor: const Color.fromARGB(255, 218, 218, 218),
            totalSwitches: 2,
            icons: const [
              Icons.nightlight,
              Icons.sunny,
            ],
            iconSize: 30.0,
            activeBgColors: const [
              [
                Color.fromARGB(255, 51, 203, 255),
                Color.fromARGB(255, 13, 176, 231)
              ],
              [
                Color.fromARGB(255, 252, 255, 59),
                Color.fromARGB(255, 255, 169, 40)
              ],
            ],
            animate: true,
            curve: Curves.fastLinearToSlowEaseIn,
            onToggle: (index) {
              if (lastToggleIndex != index) {
                lastToggleIndex = index!;
              }
              indexDegistir(index);
              if (index == 1) {
                leftCarPosition = 320.0;
                rightCarPosition = 0.0;
              } else {
                leftCarPosition = 0.0;
                rightCarPosition = 100.0;
              }
            },
          ),
        ),
      ],
    );
  }
}


/*
  Widget texts(String mainText, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(mainText,
              style: const TextStyle(
                  color: Color.fromARGB(255, 48, 48, 48),
                  fontSize: 20,
                  //fontFamily: "Oswald",
                  fontWeight: FontWeight.w400)),
          Text(description,
              style: const TextStyle(
                  color: Color.fromARGB(255, 48, 48, 48),
                  fontSize: 14,
                  // fontFamily: "Oswald",
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }
*/