import 'package:amwal_pay_sdk/core/resources/color/colors.dart';
import 'package:amwal_pay_sdk/localization/locale_utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CountDownDialog extends StatelessWidget {
  final void Function() onComplete;
  final String Function(String)? globalTranslator;
  const CountDownDialog({
    Key? key,
    required this.onComplete,
    this.globalTranslator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 28),
          Text(
            'count_down'.translate(
              context,
              globalTranslator: globalTranslator,
            ),
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkGeryColor,
            ),
            child: Center(
              child: CircularCountDownTimer(
                width: 110,
                height: 110,
                duration: 5,
                fillColor: whiteColor,
                ringColor: whiteColor,
                isReverse: true,
                textStyle: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                onComplete: onComplete,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'successful_transaction'.translate(
                context,
                globalTranslator: globalTranslator,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
