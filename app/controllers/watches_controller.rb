class WatchesController < ApplicationController

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find_by(id: params[:id])
  end

  def new
  end

  def create
    @watch = Watch.new
    @watch.user_id = params[:user_id]
    @watch.movie_id = params[:movie_id]
    @watch.when = params[:when]
    @watch.where = params[:where]

    if @watch.save
      redirect_to "/watches/#{ @watch.id }"
    else
      render 'new'
    end
  end

  def edit
    @watch = Watch.find_by(id: params[:id])
  end

  def update
    @watch = Watch.find_by(id: params[:id])
    @watch.user_id = params[:user_id]
    @watch.movie_id = params[:movie_id]
    @watch.when = params[:when]
    @watch.where = params[:where]

    if @watch.save
      redirect_to "/watches/#{ @watch.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @watch = Watch.find_by(id: params[:id])
    if @watch.id != session['user_id']
      redirect_to "/users", :notice => "Can't access #{@watch.username}, fool"
    else
    @watch.destroy


    redirect_to "/watches"
    end
  end
end
