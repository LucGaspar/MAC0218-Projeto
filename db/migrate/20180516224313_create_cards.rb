class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :verse
      t.references :deck, foreign_key: true
      t.integer :n_days, default: -> { 0 }
      t.float   :e_factor, default: -> { 2.5 }
      t.datetime :played_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps 
    end
  end
end
