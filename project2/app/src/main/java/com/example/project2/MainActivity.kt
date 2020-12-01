package com.example.project2

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener {
            shareIt()
        }
    }

    //Global Variables
    lateinit var arrayAdapter: ArrayAdapter<*>

    var plant1: String = ""
    var plant2: String = ""
    var plant3: String = ""
    var plant4: String = ""
    var plant5: String = ""
    var plant6: String = ""
    var plant7: String = ""
    var plant8: String = ""
    var plant9: String = ""
    var plant10: String = ""

    var zoneTitle: String = ""


    //https://code.tutsplus.com/tutorials/android-sdk-implement-a-share-intent--mobile-8433
    fun shareIt() { //Function to share zone list
        val sharingIntent = Intent(Intent.ACTION_SEND)
        sharingIntent.setType("text/plain")
        val shareBody =  zoneTitle + ": " + plant1 + ", " + plant2 + ", " + plant3 + ", " + plant4 + ", " + plant5 + ", " + plant6 + ", " + plant7 + ", " + plant8 + ", " + plant9 + ", " + plant10
        sharingIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, "Subject Here");
        sharingIntent.putExtra(android.content.Intent.EXTRA_TEXT, shareBody);
        startActivity(Intent.createChooser(sharingIntent, "Share via"));
    }

    fun changeToZone2(view: View) {

        plant1 = "Carrots"
        plant2 = "Onions"
        plant3 = "Poppies"
        plant4 = "Juniper"
        plant5 = "Iceland Poppy"
        plant6 = "Beets"
        plant7 = "Brussels Sprouts"
        plant8 = "Cabbage"
        plant9 = "Celery"
        plant10 = "Dill"

        val zone2 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone2)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 2"

        updateUI()
    }



    fun changeToZone3(view: View) {

        plant1 = "Asparagus"
        plant2 = "Cucumbers"
        plant3 = "Garlic"
        plant4 = "Aster"
        plant5 = "Asiatic Lilies"
        plant6 = "Foxglove"
        plant7 = "Heliopsis"
        plant8 = "Hostas"
        plant9 = "Ligularia"
        plant10 = "Creeping Phlox"

        val zone3 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone3)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 3"

        updateUI()
    }

    fun changeToZone4(view: View) {

        plant1 = "Eggplant"
        plant2 = "Pumpkin"
        plant3 = "Iris"
        plant4 = "Daylily"
        plant5 = "Shasta Daisies"
        plant6 = "Yarrow"
        plant7 = "Rockcress"
        plant8 = "Goat's Beard"
        plant9 = "Violets"
        plant10 = "Cherry"

        val zone4 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone4)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 4"

        updateUI()
    }

    fun changeToZone5(view: View) {

        plant1 = "Radishes"
        plant2 = "Spinach"
        plant3 = "Honeycrisp Apples"
        plant4 = "Lavender"
        plant5 = "Echinacea"
        plant6 = "Hollyhock"
        plant7 = "Butterfly Weed"
        plant8 = "Ferns"
        plant9 = "Spiderwort"
        plant10 = "Balloon Flower"

        val zone5 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone5)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 5"

        updateUI()
    }
    fun changeToZone6(view: View) {

        plant1 = "Winter Squash"
        plant2 = "Butter Lettuce"
        plant3 = "Oregano"
        plant4 = "Coriander"
        plant5 = "Tomatoes"
        plant6 = "Potatoes"
        plant7 = "Squash"
        plant8 = "Coral Bells"
        plant9 = "Hellebore"
        plant10 = "Rose"

        val zone6 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone6)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 6"

        updateUI()
    }

    fun changeToZone7(view: View) {

        plant1 = "Turnips"
        plant2 = "Arugula"
        plant3 = "Peony"
        plant4 = "Forget-me-nots"
        plant5 = "Dogwood"
        plant6 = "River Birch"
        plant7 = "Burning Bush"
        plant8 = "Oakleaf Hydrangea"
        plant9 = "Coral Bark Maple"
        plant10 = "Ninebark"

        val zone7 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone7)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 7"

        updateUI()
    }

    fun changeToZone8(view: View) {

        plant1 = "Watermelon"
        plant2 = "Okra"
        plant3 = "Lantana"
        plant4 = "Sage"
        plant5 = "Artichokes"
        plant6 = "Asparagus"
        plant7 = "Cardoon"
        plant8 = "Prickly Pear Cactus"
        plant9 = "Rhubarb"
        plant10 = "Strawberries"

        val zone8 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone8)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 8"

        updateUI()
    }

    fun changeToZone9(view: View) {

        plant1 = "Broccoli"
        plant2 = "Avocado"
        plant3 = "Mandarin Oranges"
        plant4 = "Zinnias"
        plant5 = "Dahlias"
        plant6 = "Bee Balm"
        plant7 = "Beets"
        plant8 = "Amaryllis"
        plant9 = "Black-Eyed Susans"
        plant10 = "Columbine"

        val zone9 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone9)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 9"

        updateUI()
    }

    fun changeToZone10(view: View) {

        plant1 = "Peanuts"
        plant2 = "Ginger"
        plant3 = "Agave"
        plant4 = "Geraniums"
        plant5 = "Bell Peppers"
        plant6 = "Celery"
        plant7 = "Figs"
        plant8 = "Grapes"
        plant9 = "Jasmine"
        plant10 = "Marigolds"

        val zone10 = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        var mListView = findViewById<ListView>(R.id.userlist)
        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, zone10)
        mListView.adapter = arrayAdapter

        zoneTitle = "Plants for Zone 10"

        updateUI()
    }

    fun updateUI(){

        var plantList = arrayOf(plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9, plant10)

        var mListView = findViewById<ListView>(R.id.userlist)

        //https://www.tutorialspoint.com/android/android_list_view.htm

        arrayAdapter = ArrayAdapter(this,
                android.R.layout.simple_list_item_1, plantList)
        val currentZone = findViewById<TextView>(R.id.textView)
        currentZone.setText(zoneTitle)
        mListView.adapter = arrayAdapter

    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("zoneTitle", zoneTitle)
        outState.putString("plant1", plant1)
        outState.putString("plant2", plant2)
        outState.putString("plant3", plant3)
        outState.putString("plant4", plant4)
        outState.putString("plant5", plant5)
        outState.putString("plant6", plant6)
        outState.putString("plant7", plant7)
        outState.putString("plant8", plant8)
        outState.putString("plant9", plant9)
        outState.putString("plant10", plant10)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        zoneTitle = savedInstanceState.getString("zoneTitle", "")
        plant1 = savedInstanceState.getString("plant1", "")
        plant2 = savedInstanceState.getString("plant2", "")
        plant3 = savedInstanceState.getString("plant3", "")
        plant4 = savedInstanceState.getString("plant4", "")
        plant5 = savedInstanceState.getString("plant5", "")
        plant6 = savedInstanceState.getString("plant6", "")
        plant7 = savedInstanceState.getString("plant7", "")
        plant8 = savedInstanceState.getString("plant8", "")
        plant9 = savedInstanceState.getString("plant9", "")
        plant10 = savedInstanceState.getString("plant10", "")

        updateUI()
    }
}