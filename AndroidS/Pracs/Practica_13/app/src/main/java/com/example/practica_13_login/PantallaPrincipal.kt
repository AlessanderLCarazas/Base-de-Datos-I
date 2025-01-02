package com.example.practica_13_login

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class PantallaPrincipal : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pantalla_principal)

        val previoIntent: Intent = getIntent()
        val sUsuario: String = previoIntent.getStringExtra("usuario").toString()

        findViewById<TextView>(R.id.txt_bienvenida).text = "Bienvenido:\n$sUsuario"
    }
}