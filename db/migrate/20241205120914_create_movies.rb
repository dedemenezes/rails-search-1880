class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :synopsis
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
