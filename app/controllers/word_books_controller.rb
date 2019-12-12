class WordBooksController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @words = current_user.word_books.all
  end

  def new
    @word = current_user.word_books.new
  end
  def create
    @word = current_user.word.new(word_params)
    @word.save
  end
  
  private
  def word_params
    params.require(:word).permit(:eword, :jword)
  end
end
