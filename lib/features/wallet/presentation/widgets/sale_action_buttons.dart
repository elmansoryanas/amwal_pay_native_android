import 'package:amwal_pay_sdk/core/apiview/api_view.dart';
import 'package:amwal_pay_sdk/core/base_state/base_cubit_state.dart';
import 'package:amwal_pay_sdk/core/ui/buttons/app_button.dart';
import 'package:amwal_pay_sdk/features/payment_argument.dart';
import 'package:amwal_pay_sdk/features/wallet/cubit/sale_by_wallet_cubit.dart';
import 'package:amwal_pay_sdk/features/wallet/cubit/sale_by_wallet_pay_cubit.dart';
import 'package:amwal_pay_sdk/features/wallet/cubit/sale_by_wallet_verify_cubit.dart';
import 'package:amwal_pay_sdk/features/wallet/data/models/response/verify_customer_response.dart';
import 'package:amwal_pay_sdk/features/wallet/data/models/response/wallet_pay_response.dart';
import 'package:amwal_pay_sdk/features/wallet/dependency/injector.dart';
import 'package:amwal_pay_sdk/features/wallet/presentation/widgets/sale_by_wallet_mixins/sale_by_wallet_action_mixin.dart';
import 'package:amwal_pay_sdk/features/wallet/presentation/widgets/sale_by_wallet_mixins/sale_by_wallet_pay_mixin.dart';
import 'package:amwal_pay_sdk/features/wallet/presentation/widgets/sale_by_wallet_mixins/sale_by_wallet_verify_mixin.dart';
import 'package:amwal_pay_sdk/features/wallet/state/sale_by_wallet_state.dart';

import 'package:amwal_pay_sdk/localization/locale_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaleActionButtons extends ApiView<SaleByWalletCubit>
    with
        SaleByWalletActionsMixin,
        SaleByWalletVerifyMixin,
        SaleByWalletPayMixin {
  const SaleActionButtons({
    Key? key,
    required this.paymentArguments,
    this.globalTranslator,
  }) : super(key: key);
  final PaymentArguments paymentArguments;
  final String Function(String)? globalTranslator;

  @override
  Widget build(BuildContext context) {
    final verifyCubit = WalletInjector.instance.get<SaleByWalletVerifyCubit>();
    final payCubit = WalletInjector.instance.get<SaleByWalletPayCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<SaleByWalletVerifyCubit,
            ICubitState<VerifyCustomerResponse>>(
          bloc: verifyCubit,
          listener: (_, state) {
            state.whenOrNull(success: (value) {
              if (value.success) {
                cubit.verified();
              }
            });
          },
        ),
        BlocListener<SaleByWalletPayCubit, ICubitState<WalletPayResponse>>(
          bloc: payCubit,
          listener: (_, state) async {
            final walletPayData =
                state.mapOrNull(success: (value) => value.uiModel.data);
            if (walletPayData != null) {
              await showCountingDialog(
                context,
                walletPayData,
                globalTranslator,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<SaleByWalletCubit, SaleByWalletState>(
        bloc: cubit,
        builder: (_, state) {
          if (cubit.state.page == 2) {
            return const SizedBox();
          } else if (cubit.state.verified) {
            return Row(
              children: [
                const SizedBox(width: 24),
                Expanded(
                  child: AppOutlineButton(
                    onPressed: cubit.onCancel,
                    title: 'cancel'.translate(
                      context,
                      globalTranslator: globalTranslator,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: AppButton.small(
                    onPressed: () async => await pay(
                      page: state.page,
                      payCubit: payCubit,
                      paymentArguments: paymentArguments,
                      alias: cubit.aliasName,
                      mobileNumber: cubit.phoneNumber,
                    ),
                    child: Text(
                      'pay'.translate(
                        context,
                        globalTranslator: globalTranslator,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            );
          } else {
            return AppButton(
              onPressed: () async => await verifyCustomer(
                verifyCubit: verifyCubit,
                paymentArguments: paymentArguments,
              ),
              child: Text(
                'verify'.translate(
                  context,
                  globalTranslator: globalTranslator,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
