import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 45;
  List<int> lottoNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              _Header(),
              _Body(
                lottoNumbers: lottoNumbers,
              ),
              _Footer(
                onPressed: onPressGenerateButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressGenerateButton() {
    final random = Random();

    final Set<int> lottoSet = {};

    while (lottoSet.length != 7) {
      final number = random.nextInt(maxNumber);

      lottoSet.add(number);
    }

    setState(() {
      lottoNumbers = lottoSet.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "로또 번호 추첨기",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> lottoNumbers;

  const _Body({
    required this.lottoNumbers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: lottoNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map(
                        (e) => Text(
                          "${e}",
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text(
          "추첨하기",
        ),
      ),
    );
  }
}
