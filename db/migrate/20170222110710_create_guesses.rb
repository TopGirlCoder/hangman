class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :letter
      t.boolean :correct?, default: false
      t.references :game

      t.timestamps
    end
  end
end
