class AddReferencesToWordBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :word_books, :user, foreign_key: true
  end
end
