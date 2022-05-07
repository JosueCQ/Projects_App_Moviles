package com.example.nutricare

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class Diets_Recipes : AppCompatActivity() {

    var recipes = ArrayList<Recipe>()

    var recipeAdapter = RecipeAdapter(recipes)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_diets_recipes)

        val actionBar = supportActionBar

        actionBar!!.title = "Dietas/Recetas"

        actionBar.setDisplayHomeAsUpEnabled(true)

        loadRecipes()
        initView()
    }

    private fun initView() {
        //vinculo el adapter al rV
        val rvRecipe = findViewById<RecyclerView>(R.id.rvDietRecep)
        rvRecipe.adapter = recipeAdapter
        rvRecipe.layoutManager = LinearLayoutManager(this)
    }

    private fun loadRecipes() {
        recipes.add(Recipe("Ensalada Fresca", "Esta ensalada esta comprendida por bla bla bla bla bla", "50"))
        recipes.add(Recipe("Ensalada Rusa", "Esta ensalada esta comprendida por veterraga, leghuga y bla bla bla bla bla", "40"))
        recipes.add(Recipe("Ensalada de Frutas", "Esta ensalada esta tiene diversas frutas como bla bla bla bla bla", "70"))

    }
}