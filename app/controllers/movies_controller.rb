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
    @movie.year = params[:year]
    @movie.rating = params[:rating]
    @movie.runtime = params[:runtime]
    @movie.synopsis = params[:synopsis]
    @movie.poster = params[:poster]
    @movie.critics_rating = params[:critics_rating]
    @movie.critics_score = params[:critics_rating]
    @movie.audience_rating = params[:audience_rating]
    @movie.audience_score= params[:audience_score]

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
    @movie.year = params[:year]
    @movie.rating = params[:rating]
    @movie.runtime = params[:runtime]
    @movie.synopsis = params[:synopsis]
    @movie.poster = params[:poster]
    @movie.critics_rating = params[:critics_rating]
    @movie.critics_score = params[:critics_rating]
    @movie.audience_rating = params[:audience_rating]
    @movie.audience_score= params[:audience_score]

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
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=js5cqpuccjd47ymjtjwhcnsy&q=#{ search }&page_limit=50"
    result = open(url).read
    @parsed_result = JSON.parse(result)
  end
  
  def seenit
    @userid = session['userid']
    id = params['id']
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{ id }.json?apikey=js5cqpuccjd47ymjtjwhcnsy"
    result = open(url).read
    @parsed_result = JSON.parse(result)
    if Movie.find_by(title: @parsed_result['title'])
      u = User.find_by_id(session['user_id'])
      @watch = Watch.new
      url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{ id }.json?apikey=js5cqpuccjd47ymjtjwhcnsy"
      result = open(url).read
      @parsed_result = JSON.parse(result)
      @watch = Watch.new
      @watch.movie_title = @parsed_result['title']
      @watch.username = u.name
      @watch.movie_id = id
      @watch.user_id = session['user_id']
      @watch.save
      redirect_to "/users/#{ @userid }"
    else
      u = User.find_by_id(session['user_id'])
      url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{ id }.json?apikey=js5cqpuccjd47ymjtjwhcnsy"
      result = open(url).read
      @parsed_result = JSON.parse(result)
      @movie = Movie.new
      @movie.title = @parsed_result['title']
      @movie.rating = @parsed_result['mpaa_rating']
      @movie.runtime = @parsed_result['runtime']
      @movie.synopsis = @parsed_result['synopsis']
      @movie.poster = @parsed_result['posters']['original']
      @movie.critics_rating = @parsed_result['ratings']['critics_rating']
      @movie.critics_score = @parsed_result['ratings']['critics_score']
      @movie.audience_rating = @parsed_result['ratings']['audience_rating']
      @movie.audience_score= @parsed_result['ratings']['audience_score']
      @movie.save
      @watch1 = Watch.new
      @watch1.movie_title = @parsed_result['title']
      @watch1.username = u.name
      @watch1.movie_id = id
      @watch1.user_id = session['user_id']
      @watch1.save
      redirect_to "/users/#{ @userid }"
    end
  end
    
end
