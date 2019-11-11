class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def new
    @diary = Diary.new
  end

  def edit
  end
  def create
    diary = Diary.new(diary_params)
    diary.save
    redirect_to diaries_url
  end 

private
 def diary_params
   params.require(:diary).permit(:day,:title,:description)
 end 
end
