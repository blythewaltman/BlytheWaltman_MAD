package com.example.lab9

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton
import kotlinx.android.synthetic.main.content_movie.*

class MovieActivity : AppCompatActivity() {
    private var movieSuggestName : String? = null
    private var movieSuggestUrl : String? = null


    override fun onCreate(savedInstanceState: Bundle?) {


        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_movie)
        setSupportActionBar(findViewById(R.id.toolbar))

        movieSuggestName = intent.getStringExtra("movieSuggestName")
        movieSuggestUrl = intent.getStringExtra("movieSuggestURL")

        movieSuggestName?.let { Log.i("movie received", it)};
        movieSuggestUrl?.let {Log.i("url received", it)};

        movieSuggestName?.let {movieSuggestTextView.text = "You should watch $movieSuggestName"}

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener {
            loadWebSite()
        }
    }

    fun loadWebSite(){
        // create intent
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = movieSuggestUrl?.let{Uri.parse(movieSuggestUrl)}
        startActivity(intent)
    }

    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackEditText.text.toString())
        setResult(Activity.RESULT_OK, data)
        super.onBackPressed()
        finish()
    }
}