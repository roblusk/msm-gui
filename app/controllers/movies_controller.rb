class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def create
    the_movie = Movie.new
    the_movie.title = params.fetch("title_input")
    the_movie.year = params.fetch("year_input")
    the_movie.duration = params.fetch("duration_input")
    the_movie.description = params.fetch("description_input")
    the_movie.image = params.fetch("image_input")
    the_movie.save
    redirect_to("/movies")
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def delete_this
    the_id = params.fetch("path_id")
    the_movie = Movie.find(the_id)
    the_movie.destroy
    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("path_id")
    the_movie = Movie.find(the_id)
    the_movie.title = params.fetch("title_input")
    the_movie.year = params.fetch("year_input")
    the_movie.duration = params.fetch("duration_input")
    the_movie.description = params.fetch("description_input")
    the_movie.image = params.fetch("image_input")
    the_movie.save
    redirect_to("/movies/#{the_movie.id}")
  end
end
