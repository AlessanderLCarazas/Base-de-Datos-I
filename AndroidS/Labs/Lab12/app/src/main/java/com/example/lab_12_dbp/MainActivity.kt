package com.example.lab_12_dbp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.btn_Mostrar_Descripcion).setOnClickListener({mostrarDescipcion()})
    }

    private  fun mostrarDescipcion(){
        val sNombre: String = findViewById<EditText>(R.id.txt_nombre).text.toString()
        val sEmail: String = findViewById<EditText>(R.id.txt_email).text.toString()
        val sContraseña: String = findViewById<EditText>(R.id.text_contraseña).text.toString()
        val sCelular: String = findViewById<EditText>(R.id.txt_cel_numero).text.toString()

        val rbSeleccionadoId: Int = findViewById<RadioGroup>(R.id.rbg_Grupo_01).checkedRadioButtonId
        val sSexo: String

        if(findViewById<RadioButton>(rbSeleccionadoId).text.toString() == "Masculino"){
            sSexo = "Hombre"
        } else {
            sSexo = "Mujer"
        }

        val cbSeleccionadoIdEstudiar: Boolean = findViewById<CheckBox>(R.id.txt_estudiar).isChecked
        val sCBestudiar: String
        if((cbSeleccionadoIdEstudiar)){
            sCBestudiar = "Estudiar"
        } else {
            sCBestudiar = ""
        }

        val cbSeleccionadoIdCocinar: Boolean = findViewById<CheckBox>(R.id.txt_cocinar).isChecked
        val sCBcocinar: String
        if((cbSeleccionadoIdCocinar)){
            sCBcocinar = "Cocinar"
        } else {
            sCBcocinar = ""
        }

        val cbSeleccionadoIdCantar: Boolean = findViewById<CheckBox>(R.id.txt_cantar).isChecked
        val sCBcantar: String
        if((cbSeleccionadoIdCantar)){
            sCBcantar = "Cantar"
        } else {
            sCBcantar = ""
        }

        val cbSeleccionadoIdBailar: Boolean = findViewById<CheckBox>(R.id.txt_bailar).isChecked
        val sCBbailar: String
        if((cbSeleccionadoIdBailar)){
            sCBbailar = "Bailar"
        } else {
            sCBbailar = ""
        }

        val sResultado = "Su nombre es $sNombre, su correo es $sEmail, su contraseña: $sContraseña, su celular: $sCelular y Ud. es $sSexo \n"
        val sResultado2 = "Pasatiempos: $sCBestudiar $sCBcocinar $sCBcantar $sCBbailar"
        findViewById<TextView>(R.id.txt_descripcion).text = sResultado+sResultado2
    }
}