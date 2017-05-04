class MovieController < ApplicationController
    @@api_url='http://www.omdbapi.com/?t='
    
    def index
        require('json')
        require('open-uri')
        
        @movie_list = List.all
    end
    
    def new_movie
        require('json')
        require('open-uri')
        title = params[:title]
        
        temp_url = @@api_url + title
        info_page = open(temp_url)
        data = info_page.read
        movie_info = JSON.parse(data)
        
        
        new=List.new
        new.title = title
        new.director = movie_info["Director"]
        new.runtime = movie_info["Runtime"]
        new.genre = movie_info["Genre"]
        new.released = movie_info["Released"]
        new.imgsrc = movie_info["Poster"]
        new.review[0]="dkhfkdh"
        #new.review = []
        new.save
        
        redirect_to '/'
    end
    
    def delete
    delete_list = List.find(params[:id])
    delete_list.destroy
   
    redirect_to '/'
    end
    
    def write_review
        review_list = List.find(params[:id])
        review_temp= params[:review]
        review_list.review << review_temp    
    redirect_to '/'
    end
end
