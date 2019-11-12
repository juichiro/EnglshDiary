class DiariesController < ApplicationController
  before_action :authenticate_user!
  def index
    @diaries = current_user.diaries.all
  end 
  def show
    @diary = current_user.diaries.find(params[:id])
  end

  def new
    @diary = current_user.diaries.new
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
  end
  def create
    diary = current_user.diaries.new(diary_params)
    diary.save
    redirect_to diaries_url
  end 
  def update
    @diary = current_user.diaries.find(params[:id])
    @diary.update(diary_params)
    redirect_to @diary
  end 
  def destroy
    @diary = current_user.diaries.find(params[:id])
    @diary.destroy
    redirect_to diaries_url
  end 
  def translate_new
  end
  def show_translated_text
     client = Aws::Translate::Client.new(region: 'us-west-2')
     @result = client.translate_text(text: params[:text], source_language_code:'ja',target_language_code: 'en')
  end

private
 def diary_params
   params.require(:diary).permit(:day,:title,:description)
 end 
end
