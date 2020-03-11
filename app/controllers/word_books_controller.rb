class WordBooksController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @word = current_user.word_books.new
    @words = current_user.word_books.paginate(page: params[:page], per_page: 20).order('created_at DESC')
  end

  def new
    @word = current_user.word_books.new
  end
  def create
    @word = current_user.word_books.new(word_params)
    if @word.save
      flash[:notice] = '正常に追加しました'
      redirect_to word_books_index_url
    else 
      flash.now[:notice] = '追加できませんでした'
      @words = current_user.word_books.paginate(page: params[:page], per_page: 20)
      render :index
    end
  end
  def destroy
    @word = current_user.word_books.find(params[:id])
    @word.destroy
    redirect_to word_books_index_url
  end
  
  private
  def word_params
    params.require(:word_book).permit(:eword, :jword)
  end
end 
