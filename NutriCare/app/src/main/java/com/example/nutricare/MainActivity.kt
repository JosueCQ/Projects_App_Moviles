package com.example.nutricare

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btDietRecep = findViewById<Button>(R.id.btDietRece)

        btDietRecep.setOnClickListener {
            val intent = Intent(this, Diets_Recipes::class.java)
            startActivity(intent)
        }
    }
}