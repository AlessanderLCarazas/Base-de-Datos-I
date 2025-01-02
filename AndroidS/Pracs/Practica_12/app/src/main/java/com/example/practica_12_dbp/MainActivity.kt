package com.example.practica_12_dbp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextClock
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.btn_suma).setOnClickListener({suma()})
        findViewById<Button>(R.id.btn_resta).setOnClickListener({resta()})
        findViewById<Button>(R.id.btn_multiplicar).setOnClickListener({multiplicar()})
        findViewById<Button>(R.id.btn_dividir).setOnClickListener({dividir()})
    }

    private fun suma(){
        var sNum1: String = findViewById<EditText>(R.id.num_1).text.toString();
        var sNum2: String = findViewById<EditText>(R.id.num_2).text.toString();

        var iNum1: Int = sNum1.toInt()
        var iNum2: Int = sNum2.toInt()
        var iResu: Int = iNum1 + iNum2

        findViewById<TextView>(R.id.num_resultado).text = iResu.toString();
    }

    private fun resta(){
        var sNum1: String = findViewById<EditText>(R.id.num_1).text.toString();
        var sNum2: String = findViewById<EditText>(R.id.num_2).text.toString();

        var iNum1: Int = sNum1.toInt()
        var iNum2: Int = sNum2.toInt()
        var iResu: Int = iNum1 - iNum2

        findViewById<TextView>(R.id.num_resultado).text = iResu.toString();
    }

    private fun multiplicar(){
        var sNum1: String = findViewById<EditText>(R.id.num_1).text.toString();
        var sNum2: String = findViewById<EditText>(R.id.num_2).text.toString();

        var iNum1: Int = sNum1.toInt()
        var iNum2: Int = sNum2.toInt()
        var iResu: Int = iNum1 * iNum2

        findViewById<TextView>(R.id.num_resultado).text = iResu.toString();
    }

    private fun dividir(){
        var sNum1: String = findViewById<EditText>(R.id.num_1).text.toString();
        var sNum2: String = findViewById<EditText>(R.id.num_2).text.toString();

        var iNum1: Float = sNum1.toFloat()
        var iNum2: Float = sNum2.toFloat()
        var iResu: Float = iNum1 / iNum2

        findViewById<TextView>(R.id.num_resultado).text = iResu.toString();
    }
}