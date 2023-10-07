package com.fluttertask.fluttertask

import android.os.Bundle
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import org.json.JSONObject

class MainActivity : FlutterActivity() {
    private val CHANNEL = "stack_exchange_plugin"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "fetchQuestions") {
                    fetchQuestions(result)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun fetchQuestions(result: MethodChannel.Result) {
        CoroutineScope(Dispatchers.IO).launch {
            val apiUrl =
                "https://api.stackexchange.com/2.3/questions?pagesize=1&order=desc&sort=activity&site=stackoverflow"
            val client = OkHttpClient()
            val request = Request.Builder()
                .url(apiUrl)
                .build()

            try {
                val response = client.newCall(request).execute()
                if (response.isSuccessful) {
                    val responseData = response.body?.string()
                    val jsonObject = JSONObject(responseData)
                    val jsonArray = jsonObject.getJSONArray("items")
                    val message = "Successfully fetched ${jsonArray.length()} question(s)"
                    showToast(message)
                    result.success(true)
                } else {
                    result.error("API Error", "Failed to fetch questions", null)
                }
            } catch (e: Exception) {
                result.error("Exception", e.message, null)
            }
        }
    }

    private fun showToast(message: String) {
        runOnUiThread {
            Toast.makeText(applicationContext, message, Toast.LENGTH_SHORT).show()
        }
    }
}