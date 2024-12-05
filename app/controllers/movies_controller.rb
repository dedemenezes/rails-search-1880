class MoviesController < ApplicationController
  def index
    # raise
    @movies = Movie.all
    # if there is a query string
    # we should filter the array of movies
    if params[:query].present?
      # @movies = @movies.where(title: params[:query])
      # SQL INJECTION!!!
      # @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%") # ILIKE is for case insensitive

      # MULTIPLE COLUMNS!
      # @movies = @movies.where("title ILIKE :query OR synopsis ILIKE :query", query: "%#{params[:query]}%") # ILIKE is for case insensitive

      # THROUGH ASSOCIATIONS
      # sub_query = <<~SQL
      #   movies.title ILIKE :query OR
      #   movies.synopsis ILIKE :query OR
      #   directors.first_name ILIKE :query OR
      #   directors.last_name ILIKE :query
      # SQL
      # @movies = @movies.joins(:director).where(sub_query, query: "%#{params[:query]}%") # ILIKE is for case insensitive

      # # MULTIPLE TERMS!
      # sub_query = <<~SQL
      #   movies.title @@ :query OR
      #   movies.synopsis @@ :query OR
      #   directors.first_name @@ :query OR
      #   directors.last_name @@ :query
      # SQL
      # @movies = @movies.joins(:director).where(sub_query, query: "%#{params[:query]}%") # ILIKE is for case insensitive

      # USING PG_SEARCH
      # @movies = @movies.search_by_title_and_synopsis(params[:query])
      @movies = @movies.global_search(params[:query])
    end
  end
end
