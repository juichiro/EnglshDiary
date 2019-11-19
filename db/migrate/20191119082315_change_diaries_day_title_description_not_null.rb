class ChangeDiariesDayTitleDescriptionNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :diaries, :day, false
    change_column_null :diaries, :title, false
    change_column_null :diaries, :description, false
  end
end
