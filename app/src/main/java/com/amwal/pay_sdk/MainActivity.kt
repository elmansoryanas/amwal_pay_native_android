package com.amwal.pay_sdk

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.blankj.utilcode.util.ActivityUtils
import io.flutter.embedding.android.FlutterActivity
import java.util.Currency


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val token = intent.extras?.getString(AmwalPaySDK.tokenKey)
        val merchantName = intent.extras?.getString(AmwalPaySDK.merchantNameKey)
        val merchantId = intent.extras?.getString(AmwalPaySDK.merchantIdKey)
        val currency = intent.extras?.getSerializable(AmwalPaySDK.currencyKey) as Currency

        val flutterActivity = FlutterActivity.withNewEngine().dartEntrypointArgs(
            listOf(
                token,
                "secureHash",
                merchantId,
                currency.displayName,
                "1566",
                "155",
                "1",
                "0",
                "459",
            )
        ).build(this)
        ActivityUtils.startActivity(flutterActivity)
    }
}