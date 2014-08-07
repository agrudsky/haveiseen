class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def new
  end

  def create
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.releasedate = params[:releasedate]
    @movie.rating = params[:rating]
    @movie.runtime = params[:runtime]
    @movie.genre = params[:genre]
    @movie.director = params[:director]
    @movie.writer = params[:writer]
    @movie.actors = params[:actors]
    @movie.plot = params[:plot]
    @movie.language = params[:language]
    @movie.country = params[:country]
    @movie.awards = params[:awards]
    @movie.poster = params[:poster]
    @movie.metascore = params[:metascore]
    @movie.imdbrating = params[:imdbrating]

    if @movie.save
      redirect_to "/movies/#{ @movie.id }"
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.title = params[:title]
    @movie.releasedate = params[:releasedate]
    @movie.rating = params[:rating]
    @movie.runtime = params[:runtime]
    @movie.genre = params[:genre]
    @movie.director = params[:director]
    @movie.writer = params[:writer]
    @movie.actors = params[:actors]
    @movie.plot = params[:plot]
    @movie.language = params[:language]
    @movie.country = params[:country]
    @movie.awards = params[:awards]
    @movie.poster = params[:poster]
    @movie.metascore = params[:metascore]
    @movie.imdbrating = params[:imdbrating]

    if @movie.save
      redirect_to "/movies/#{ @movie.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy


    redirect_to "/movies"
  end
  
  def search
  end
  
  def result
    search = params['search'].gsub(" ", "+")
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=js5cqpuccjd47ymjtjwhcnsy&q=#{ search }&page_limit=3"
    result = open(url).read
    @parsed_result = JSON.parse(result)
  end
end
