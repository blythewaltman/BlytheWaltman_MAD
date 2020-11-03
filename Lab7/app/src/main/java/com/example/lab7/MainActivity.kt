package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun growPlant(view: View) {
        //TextView
       val growText = findViewById<TextView>(R.id.growMessage)


        //EditText
        val editName = findViewById<EditText>(R.id.editTextName)
        val name = editName.text

        growText.setText("" + name + " is growing!")

        //Image
        val imagePlant = findViewById<ImageView>(R.id.imageView)
        imagePlant.setImageResource(R.drawable.big_plant)
    }
}