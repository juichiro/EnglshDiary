class AddUserToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :diaries, :user
  end
end
