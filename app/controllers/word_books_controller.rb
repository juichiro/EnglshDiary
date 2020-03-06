class WordBooksController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @word = current_user.word_books.new
    @words = current_user.word_books.paginate(page: params[:page], per_page: 20)
  end

  def new
    @word = current_user.word_books.new
  end
  def create
    @word = current_user.word_books.new(word_params)
    @word.save
    redirect_to word_books_index_url
  end
  
  private
  def word_params
    params.require(:word_book).permit(:eword, :jword)
  end
end 
