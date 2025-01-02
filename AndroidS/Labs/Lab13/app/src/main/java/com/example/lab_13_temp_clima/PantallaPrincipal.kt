package com.example.lab_13_temp_clima

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import org.json.JSONObject


class PantallaPrincipal : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pantalla_principal)

    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onResume() {
        super.onResume()
        if(!validarConexion()){
            Toast.makeText(this, "Valide su Conexion a Internet.", Toast.LENGTH_LONG).show()
            findViewById<TextView>(R.id.txt_grados).text = "0º"
            findViewById<TextView>(R.id.txt_estado).text = "------------"
            findViewById<TextView>(R.id.txt_ciudad).text = "------------"
            return
        }

        //8ce76b24b02e26eb243dca105763027b
        // Juliaca id: 3937513
        // url: https://api.openweathermap.org/data/2.5/weather?id=3937513&appid=8ce76b24b02e26eb243dca105763027b&lang=es&units=metric

        val url = "https://api.openweathermap.org/data/2.5/weather?id=3937513&appid=8ce76b24b02e26eb243dca105763027b&lang=es&units=metric"
        val solicitud = Volley.newRequestQueue(applicationContext)
        val stringRequest = StringRequest(
            Request.Method.GET, url,
            {
                //response -> Log.i("RespuestaVolley",response.toString())
                response -> mostrarClima(response.toString())
            },
            {
                Log.i("RespuestaVolley", "Error")
                mostrarClima("Error")
            })
        solicitud.add(stringRequest)
    }

    private fun mostrarClima(informacion: String){
        if(informacion == "Error"){
            findViewById<TextView>(R.id.txt_grados).text = "0º"
            findViewById<TextView>(R.id.txt_estado).text = "------------"
            findViewById<TextView>(R.id.txt_ciudad).text = "------------"
            Toast.makeText(this, "Disculpe, ha ocurrido un error", Toast.LENGTH_LONG).show()
            return
        }

        val json: JSONObject = JSONObject(informacion)
        val grados: String = json.getJSONObject("main").getString("temp").toString() + "º"
        val estado: String = (json.getJSONArray("weather").get(0) as JSONObject).getString("description").toString()
        val ciudad: String = json.getString("name").toString()
        val pais: String = json.getJSONObject("sys").getString("country").toString()
        val ciudad_pais: String = "$ciudad, $pais"

        findViewById<TextView>(R.id.txt_grados).setText(grados)
        findViewById<TextView>(R.id.txt_estado).setText(estado)
        findViewById<TextView>(R.id.txt_ciudad).setText(ciudad_pais)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun validarConexion(): Boolean{
        val conectividad = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val copabilities = conectividad.getNetworkCapabilities(conectividad.activeNetwork)
        if (copabilities != null){
            when {
                copabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> {
                    return true
                }
                copabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> {
                    return true
                }
                copabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> {
                    return true
                }
            }
        }
        return false
    }
}