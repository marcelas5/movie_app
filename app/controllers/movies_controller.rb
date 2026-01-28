class MoviesController < ApplicationController
    def index
          @movies = Movie.released
    end

    def show 
          @movie = Movie.find(params[:id])
    end

    def edit 
          @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        movie_params =params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration, :image_file_name)
        if @movie.update(movie_params)
           redirect_to movie_path(@movie), notice: "Movie updated successfully"
        else 
           render :edit, status: :unprocessable_entity
        end
    end

    def new
        @movie = Movie.new
    end 

    def create 
      movie_params =params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration, :image_file_name)
      @movie = Movie.new(movie_params)      
        if @movie.save 
           redirect_to movies_path, notice: "Movie created successfully"    
        else 
           render :new, status: :unprocessable_entity
      end
    end

    def destroy 
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_url, status: :see_other, alert: "Movie deleted successfully"
        end
end
