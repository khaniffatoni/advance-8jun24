import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        InkWell(
          onTap: () => Fluttertoast.showToast(msg: 'Payment BCA'),
          child: Card(
            child: SvgPicture.asset('lib/assets/icons/ic_bca.svg'),
          ),
        ),
        GestureDetector(
          onTap: () => Fluttertoast.showToast(msg: 'Payment QRIS'),
          child: Card(
            child: SvgPicture.asset('lib/assets/icons/ic_qris.svg'),
          ),
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
