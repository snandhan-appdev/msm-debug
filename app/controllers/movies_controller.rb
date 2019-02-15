class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render("movie_templates/index.html.erb")
  end

  def show
    @movie = Movie.find(params.fetch("id_to_display"))

    render("movie_templates/show.html.erb")
  end

  def new_form
    @movies = Movie.all

    render("movie_templates/new_form.html.erb")
  end

  def create_row
    m = Movie.new
    m.title = params.fetch("title")
    m.year = params.fetch("year")
    m.duration = params.fetch("duration")
    m.description = params.fetch("description")
    m.image_url = params.fetch("image_url")
    m.save

    redirect_to("/movies", :notice => "Movie created successfully.")
  end

  def edit_form
    @movie = Movie.find(params.fetch("prefill_with_id"))

    render("movie_templates/edit_form.html.erb")
  end

  def update_row
    @movie = params.fetch("id_to_modify")
    m = Movie.find(@movie)
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image_url = params.fetch("the_image_url")
    m.save

    redirect_to("/movies/#{@movie}", :notice => "Movie updated successfully.")
  end

  def destroy_row
    movie = Movie.find(params.fetch("id_to_remove"))

    movie.destroy

    redirect_to("/movies", :notice => "Movie deleted successfully.")
  end
end
