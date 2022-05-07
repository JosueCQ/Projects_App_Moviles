package com.example.nutricare

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class Diets_Recipes : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_diets_recipes)

        val actionBar = supportActionBar

        actionBar!!.title = "Dietas/Recetas"

        actionBar.setDisplayHomeAsUpEnabled(true)
    }
}