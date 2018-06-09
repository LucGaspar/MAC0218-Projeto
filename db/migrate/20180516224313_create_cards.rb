class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :verse
      t.references :deck, foreign_key: true
      t.datetime :time_to_appear, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps 
    end
  end
end
