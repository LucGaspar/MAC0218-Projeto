class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :verse
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
