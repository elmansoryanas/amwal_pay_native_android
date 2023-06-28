
import 'package:amwal_pay_sdk/features/wallet/cubit/sale_by_wallet_pay_cubit.dart';
import 'package:amwal_pay_sdk/features/wallet/data/models/request/payment_request.dart';
import 'package:amwal_pay_sdk/features/payment_argument.dart';
import 'package:amwal_pay_sdk/features/wallet/presentation/widgets/sale_by_wallet_mixins/sale_by_wallet_action_mixin.dart';

mixin SaleByWalletPayMixin on SaleByWalletActionsMixin {
  WalletPaymentRequest _generatePayRequest(
    PaymentArguments paymentArguments,
    String alias,
    String mobileNumber,
  ) {
    final request = WalletPaymentRequest(
      id: 'id',
      orderKey: 'orderKey',
      processingCode: '3',
      transactionMethodId: 1,
      currencyId: paymentArguments.currencyData!.idN,
      amount: num.parse(paymentArguments.amount),
      terminalId: paymentArguments.terminalId,
      aliasName: alias,
      mobileNumber: mobileNumber,
    );
    return request;
  }

  Future<void> pay({
    required int page,
    required SaleByWalletPayCubit payCubit,
    required PaymentArguments paymentArguments,
    required String alias,
    required String mobileNumber,
  }) async {
    if (page == 2) {
      return;
    } else {
      final request =
          _generatePayRequest(paymentArguments, alias, mobileNumber);
      if (page == 0) {
        await payCubit.payByAlias(request);
      } else {
        await payCubit.payWithMobile(request);
      }
    }
  }
}
