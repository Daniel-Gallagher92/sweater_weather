class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:location].empty?
      render json: { error: "Please provide valid location" }, status: 400
    elsif params[:quantity].to_i < 1
      render json: { error: "Please provide valid quantity" }, status: 400
    else
      location = params[:location]
      quantity = params[:quantity]
      books = BookSearchFacade.get_books(location, quantity)
      render json: BooksSerializer.new(books)
    end
  end
end