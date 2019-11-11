class DiariesController < ApplicationController
  before_action :authenticate_user!
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
    @diary = Diary.find(params[:id])
  end
  def create
    diary = Diary.new(diary_params)
    diary.save
    redirect_to diaries_url
  end 
  def update
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to @diary
  end 
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_url
  end 

private
 def diary_params
   params.require(:diary).permit(:day,:title,:description)
 end 
end
