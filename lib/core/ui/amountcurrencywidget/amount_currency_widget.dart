import 'package:amwal_pay_sdk/core/resources/color/colors.dart';
import 'package:amwal_pay_sdk/core/ui/amountcurrencywidget/amount_currency_widget_cubit.dart';
import 'package:amwal_pay_sdk/features/currency_field/presentation/currency_field.dart';
import 'package:amwal_pay_sdk/localization/locale_utils.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AmountCurrencyWidget extends StatelessWidget {
  final AmountCurrencyWidgetCubit cubit;
  const AmountCurrencyWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'amount_label'.translate(context),
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FormBuilder(
                key: cubit.formKey,
                child: TextFormField(
                  onChanged: (value) => cubit.amountValue = value,
                  maxLines: 1,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.maxLength(9,
                          errorText: 'invalid_input_field'.translate(context)),
                      FormBuilderValidators.minLength(3,
                          errorText: 'invalid_input_field'.translate(context)),
                      FormBuilderValidators.match('^(?!.*^(00)).*\$'),
                      FormBuilderValidators.required(
                          errorText: 'required_field'.translate(context)),
                    ],
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      decimalDigits: 2,
                      symbol: '',
                      customPattern: '00.00',
                      enableNegative: false,
                    ),
                  ],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '00.00',
                    focusColor: whiteColor,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        CurrencyField(
          width: size.width * 0.35,
          height: 120,
          onChanged: (currencyData) => cubit.currencyData = currencyData,
        ),
      ],
    );
  }
}
