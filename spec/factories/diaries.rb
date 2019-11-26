FactoryBot.define do
  factory :diary do
    day"2019 January 1"
    title"Test title"
    description"Test description"
    association :user
    
    factory :diary_title_over31 do#タイトルの文字数が31文字のデータ→validationに引っかかる
      title"1234567890123456789012345678901"
    end 
    
    factory :diary_title_just30 do  #タイトルの文字数がちょうど30文字→validationに引っかからない
      title"123456789012345678901234567890"
    end
  end
end
