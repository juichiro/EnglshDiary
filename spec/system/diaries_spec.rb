require 'rails_helper'

describe '英語日記機能', type: :system do 
    describe '一覧表示機能' do
        before do 
            #ユーザー１を作成
            @user1 = FactoryBot.create(:user,email: 'test@example.com', password:'123456')
            #作成者がユーザー１であるタスクを作成
            FactoryBot.create(:diary,title: '最初の日記',user: @user1)
        end
        context 'ユーザー1がログインしている時' do
          before do  
            #ユーザー1でログイン
            visit new_user_session_path
            fill_in 'Email', with: 'test@example.com'
            fill_in 'Password', with: '123456'
            click_button 'Log in'
          end
            
        
          it 'ユーザー１の作成した日記が表示される' do 
            #ユーザー１の日記が一覧表示されていることを確認
            expect(page).to have_content '最初の日記'
          end
        end
        
    end
end

