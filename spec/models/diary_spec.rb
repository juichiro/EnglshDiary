require 'rails_helper'

RSpec.describe Diary, type: :model do
 before do #各テストケースの前で@userをセットする
    @user = User.new(
        email:'aaa@example.com',
        password:'12345'
        )
 end

  it "day,title,descriptionカラムに値が入っていれば、有効" do
    diary = @user.diaries.new(
        day: '2019 January 11',
        title: 'today was fun!',
        description: 'today was so fun because we enjoied playing baseball.'
        )  
    expect(diary).to be_valid
  end 
  
  it "dayカラムがnillなら無効" do 
    diary = @user.diaries.new(day: nil)
    diary.valid?
    expect(diary.errors[:day]).to include("can't be blank")
  end 
  
  it "titleカラムがnillなら無効" do 
    diary = @user.diaries.new(title: nil)
    diary.valid?
    expect(diary.errors[:title]).to include("can't be blank")
  end
  
  it "descriptionカラムがnillなら無効" do 
    diary = @user.diaries.new(description: nil)
    diary.valid?
    expect(diary.errors[:description]).to include("can't be blank")
  end
  
  it "titleカラムに30文字以上入力されると無効(31文字)" do 
    diary = @user.diaries.new(title: "1234567890123456789012345678901")
    diary.valid?
    expect(diary.errors[:title]).to include("is too long (maximum is 30 characters)")
  end 
  it "titleカラム30文字ぴったりなら有効" do 
    diary = @user.diaries.new(title: "123456789012345678901234567890")
    diary.valid?
    expect(diary.errors[:title]).to be_empty
  end 
end

