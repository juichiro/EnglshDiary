class CreateWordBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :word_books do |t|
      t.string :eword, null: false
      t.string :jword, null: false

      t.timestamps
    end
  end
end
