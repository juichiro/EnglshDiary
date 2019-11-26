require 'rails_helper'

RSpec.describe Diary, type: :model do
 it "Factory Bot でデータが正しく作れているか" do
   diary = FactoryBot.create(:diary)
   puts diary.inspect
   expect(diary).to be_valid
 end
  it "day,title,descriptionカラムに値が入っていれば、有効" do
    expect(FactoryBot.build(:diary)).to be_valid
  end 
  
  it "dayカラムがnillなら無効" do 
    diary = FactoryBot.build(:diary, day: nil)
    diary.valid?
    expect(diary.errors[:day]).to include("can't be blank")
  end 
  
  it "titleカラムがnillなら無効" do 
    diary = FactoryBot.build(:diary, title: nil)
    diary.valid?
    expect(diary.errors[:title]).to include("can't be blank")
  end
  
  it "descriptionカラムがnillなら無効" do 
    diary = FactoryBot.build(:diary, description: nil)
    diary.valid?
    expect(diary.errors[:description]).to include("can't be blank")
  end
  
  it "titleカラムに31文字以上入力されると無効(31文字)" do 
    diary = FactoryBot.build(:diary_title_over31)
    diary.valid?
    expect(diary.errors[:title]).to include("is too long (maximum is 30 characters)")
  end 
  it "titleカラム30文字ぴったりなら有効" do 
    diary = FactoryBot.build(:diary_title_just30)
    diary.valid?
    expect(diary.errors[:title]).to be_empty
  end 
end

