class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :shareable
      t.timestamps 
    end
  end
end
