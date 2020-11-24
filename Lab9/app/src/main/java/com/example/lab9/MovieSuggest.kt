package com.example.lab9

data class MovieSuggest(var name:String="", var url:String="") {
    fun suggestMovie(position:Int){
        setMovieName(position)
        setMovieNameUrl(position)
    }

    private fun setMovieName(position:Int) {
        when (position) {
            0 -> name = "Thor"
            1 -> name = "Leap Year"
            2 -> name = "Interstellar"
            3 -> name = "Shutter Island"
            else -> name = "Movie of your choice"
        }
    }

    private fun setMovieNameUrl(position: Int){
        when(position){
            0 -> url = "https://www.imdb.com/title/tt0800369/?ref_=fn_al_tt_1"
            1 -> url = "https://www.imdb.com/title/tt1216492/?ref_=fn_al_tt_1"
            2 -> url = "https://www.imdb.com/title/tt0816692/?ref_=fn_al_tt_1"
            3 -> url = "https://www.imdb.com/title/tt1130884/?ref_=fn_al_tt_1"
            else -> url = "https://www.imdb.com/?ref_=nv_home"
        }
    }

}