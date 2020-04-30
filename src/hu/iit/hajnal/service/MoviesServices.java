package hu.iit.hajnal.service;

import hu.iit.hajnal.dto.DTOMovies;
import hu.iit.hajnal.model.MoviesEntity;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import java.util.ArrayList;

@ManagedBean(name="moviesServices")
@ApplicationScoped
public class MoviesServices {
    private ArrayList<MoviesEntity> movies;

    public ArrayList<MoviesEntity> getMovies(){
        movies = (ArrayList<MoviesEntity>) DTOMovies.getAllMovie();
        return movies;
    }
    public void addMovie(MoviesEntity movie){
        System.out.println("Debug: Movies Services addMovie: " + movie.toString());
        DTOMovies.addMovieToDatabase(movie);
    }
    public void deleteMovie(MoviesEntity movie){
        DTOMovies.deleteMovie(movie);
    }

    public void editMovie(MoviesEntity movie){
        DTOMovies.editMovie(movie);
    }
}
