class CreateAnimes < ActiveRecord::Migration[7.0]
  def change
    create_table :animes do |t|
      t.string :name
      t.integer :episodes
      t.decimal :rating
      t.integer :members
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
