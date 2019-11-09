class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.date :day
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
