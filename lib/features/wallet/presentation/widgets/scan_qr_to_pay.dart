import 'package:amwal_pay_sdk/core/base_state/base_cubit_state.dart';
import 'package:amwal_pay_sdk/core/resources/color/colors.dart';
import 'package:amwal_pay_sdk/features/wallet/cubit/sale_by_qr_cubit.dart';
import 'package:amwal_pay_sdk/features/wallet/data/models/response/qr_response.dart';
import 'package:amwal_pay_sdk/features/wallet/dependency/injector.dart';

import 'package:amwal_pay_sdk/localization/locale_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrToPayWidget extends StatefulWidget {
  final String terminalId;
  final String Function(String)? globalTranslator;
  const ScanQrToPayWidget({
    Key? key,
    required this.terminalId,
    this.globalTranslator,
  }) : super(key: key);

  @override
  State<ScanQrToPayWidget> createState() => _ScanQrToPayWidgetState();
}

class _ScanQrToPayWidgetState extends State<ScanQrToPayWidget> {
  late SaleByQrCubit cubit;

  Future<void> _generateQrCode() async =>
      await cubit.payWithQr(widget.terminalId);

  @override
  void initState() {
    super.initState();
    cubit = WalletInjector.instance.get<SaleByQrCubit>();
    _generateQrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'scan_qr_code_to_pay'.translate(
            context,
            globalTranslator: widget.globalTranslator,
          ),
          style: const TextStyle(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<SaleByQrCubit, ICubitState<QRResponse>>(
          bloc: cubit,
          builder: (_, state) {
            final qrCodeString = state.mapOrNull(
                  success: (value) => value.uiModel.data?.qrCode,
                ) ??
                '';
            return QrImage(
              data: qrCodeString,
              size: 200,
            );
          },
        ),
      ],
    );
  }
}
