package com.amwal.pay_sdk

import android.content.Intent
import com.blankj.utilcode.util.ActivityUtils
import java.util.Currency
import java.util.Locale

class AmwalPaySDK {
    companion object{
        const val tokenKey = "token"
        const val secureHashValueKey = "secureHashValue"
        const val merchantNameKey = "merchantName"
        const val merchantIdKey = "merchantId"
        const val terminalIdKey = "terminalId"
        const val currencyKey = "currency"
        const val localeKey = "locale"
        const val isMockedKey= "isMocked"
        const val is3DSKey = "is3DS"

        fun initSdk(
            token: String,
            secureHashValue: String,
            merchantName: String,
            merchantId: Int,
            terminalId:String,
            currency: Currency,
            locale: Locale,
            isMocked: Boolean,
            is3DS: Boolean?
        ){
            val openAmwalPayIntent = Intent(ActivityUtils.getTopActivity(), MainActivity::class.java)
            openAmwalPayIntent.apply {
                putExtra(tokenKey, token)
                putExtra(merchantNameKey, merchantName)
                putExtra(merchantIdKey, merchantId)
                putExtra(terminalIdKey, terminalId)
                putExtra(secureHashValueKey, secureHashValue)
                putExtra(localeKey, locale)
                putExtra(is3DSKey, is3DS)
                putExtra(isMockedKey, isMocked)
                putExtra(currencyKey, currency)
            }
            ActivityUtils.startActivity(openAmwalPayIntent)
        }
    }


}