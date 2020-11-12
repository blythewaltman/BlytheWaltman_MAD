package com.example.lab8

import android.graphics.Movie
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.RadioButton
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    //var rating : CharSequence = ""
    //var movieDescription = "" //String
    var message: String = ""

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
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("message",message)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        updateUI()
    }

}