class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :word
      t.integer :score, default: 0
      t.integer :difficulty
      t.integer :minimum_length
      t.integer :maximum_length
      t.references :user

      t.timestamps
    end
  end
end
