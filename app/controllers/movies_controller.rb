class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #code below part 1
    @movies = Movie.all
    #code above part 1
    
    #code below part 2 & 3
    # @all_ratings = Movie.allRatings
    # @ratings = params[:ratings]
    #code above part 2 & 3
    
    @sort_column = params[:sort_by]
    #@movies = Movie.order(@sort_column).with_ratings
    # if @sort_column == 'title'
    #   @title_header = 'hilite'
    # elsif @sort_column == 'release_date'
    #   @release_date_header = 'hilite'
    # end
    
    #code below part 3 only 
    # if session[:ratings].nil?
    #   session[:ratings] = @all_ratings
    # elsif session[:sort_by].nil?
    #   session[:sort_by] = params[:sort_by]
    # end
    
    # if params[:sort_by]
    #   session[:sort_by] = params[:sort_by]
    # elsif params[:ratings]
    #   session[:ratings] = params[:ratings].keys
    # elsif params[:sort_by].nil? or params[:ratings].nil?
    #   flash.keep
    #   redirect_to movies_path(:sort_by => @sort_column, :ratings => Hash[session[:ratings].map{|x| [x,1]}])
    # end
    # @ratings = session[:ratings]
    # @sort_column = session[:sort_by]
    #code above part 3 only 
    #code below part 2 only
    # if @ratings == nil
    #   @ratings = Hash[@all_ratings.map {|x| [x,1]}]
    # end
    # @movies = Movie.order(@sort_column).where(rating: @ratings.keys)
    #code above part 2 only
    
    #code below part 3
    #@movies = Movie.order(@sort_column).where(rating: @ratings)
    #code above part 3
    
    #code below part 1 only
    @movies = Movie.order(@sort_column)
    #code above part 1 only
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

    
end
