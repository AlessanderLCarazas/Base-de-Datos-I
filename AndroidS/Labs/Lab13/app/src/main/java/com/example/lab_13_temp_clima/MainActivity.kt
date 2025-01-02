package com.example.lab_13_temp_clima

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.btn_ingresar).setOnClickListener{ingresar()}
    }

    private fun ingresar(){
        val sUsuario: String = findViewById<EditText>(R.id.txt_usuario).text.toString()
        val sClave: String = findViewById<EditText>(R.id.txt_clave).text.toString()

        if(sUsuario == "acarazas@unsa.edu.pe" && sClave == "159357"){
            //findViewById<TextView>(R.id.txt_error).text = "Usuario y Clave correctos."
            findViewById<TextView>(R.id.txt_error).text = ""
            val intent = Intent(this, PantallaPrincipal::class.java)
            intent.putExtra("usuario", sUsuario)
            startActivity(intent)
        }
        else {
            findViewById<TextView>(R.id.txt_error).text = "Usuario y/o Clave INCORRECTOS."
        }
    }
}