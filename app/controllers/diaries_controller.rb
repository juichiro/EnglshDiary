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
    @diary = current_user.diaries.new(diary_params)
    if @diary.save
      flash[:notice] = '正常に作成されました。'
      redirect_to diaries_url
    else
      flash.now[:notice] = '作成に失敗しました。'
      render :new
    end
  end
  def update
    @diary = current_user.diaries.find(params[:id])
    @diary.update(diary_params)
    flash[:notice] = '正常に更新されました。'
    redirect_to @diary
  end 
  def destroy
    @diary = current_user.diaries.find(params[:id])
    @diary.destroy
    flash[:notice] = '正常に削除されました。'
    redirect_to diaries_url
  end 
  def show_translated_text
     client = Aws::Translate::Client.new(region: 'ap-northeast-1')
     @result = client.translate_text(text: params[:diary][:text], source_language_code:'ja',target_language_code: 'en')
  end

private
 def diary_params
   params.require(:diary).permit(:day,:title,:image,:description)
 end 
end
