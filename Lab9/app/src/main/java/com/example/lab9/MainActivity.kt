package com.example.lab9

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.RadioButton
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var myMovieSuggest = MovieSuggest();
    private var selectedMoviePosition = 0
    private val REQUEST_CODE = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //event listener
        movieButton.setOnClickListener {
            selectedMoviePosition = spinner.selectedItemPosition
            myMovieSuggest.suggestMovie(selectedMoviePosition)
            Log.i("movie suggested", myMovieSuggest.name) //make sure the button and class are working
            Log.i("url suggested", myMovieSuggest.url);

            //intent
            val intent = Intent(this, MovieActivity::class.java)
            intent.putExtra("movieSuggestName", myMovieSuggest.name)
            intent.putExtra("movieSuggestURL", myMovieSuggest.url)

            startActivityForResult(intent, REQUEST_CODE)
        }

    }

    //var rating : CharSequence = ""
    //var movieDescription = "" //String
    var message: String = ""
    var feed: String = ""

    fun rateMovie(view: View){
        var rating : CharSequence = ""
        var movieDescription = "" //String

        val ratingId = radioGroup.checkedRadioButtonId

        //spinner
        val movie = spinner.selectedItem


        //switch
        if(switch1.isChecked && ratingId != -1){
            rating = findViewById<RadioButton>(ratingId).text

            //checkboxes
            if(checkBox1.isChecked){
                movieDescription += " " + checkBox1.text
            }
            if(checkBox2.isChecked){
                movieDescription += " " + checkBox2.text
            }
            if(checkBox3.isChecked){
                movieDescription += " " + checkBox3.text
            }
            if(checkBox4.isChecked){
                movieDescription += " " + checkBox4.text
            }
            if(checkBox5.isChecked){
                movieDescription += " " + checkBox5.text
            }
            if(checkBox6.isChecked){
                movieDescription += " " + checkBox6.text
            }

            if(movieDescription != "") {
                message = "You have rated $movie as $rating. The description you gave it was:$movieDescription."
            }
            else{
                message = "You have rated $movie as $rating."
            }
        }
        else if(switch1.isChecked && ratingId == -1){
            //snackbar
            val ratingSnackbar = Snackbar.make(root_layout, "Please select a rating", Snackbar.LENGTH_SHORT)
            ratingSnackbar.show()
        }
        else{
            message ="You haven't seen $movie"
        }
        updateUI()
    }

    fun updateUI(){
        //TextView
        textView2.text = message
        reviewTextView.text = feed
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
            feed = reviewTextView.getText().toString()
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("message",message)
        outState.putString("feed",feed)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        feed = savedInstanceState.getString("feed", "")
        updateUI()
    }

}