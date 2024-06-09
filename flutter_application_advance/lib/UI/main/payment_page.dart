import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_bca.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_qris.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_dana.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_bca.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_qris.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_dana.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_bca.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_qris.svg'),
        ),
        Card(
          child: SvgPicture.asset('lib/assets/icons/ic_dana.svg'),
        ),
      ],
    );
  }
}
