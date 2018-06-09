class AddDeckIdToUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :decks_access do |t|
  		t.boolean :access # 0 -> Only read | 1 -> Read and Write
  		t.references :user, foreign_key: true
  		t.references :deck, foreign_key: true
  	end
  end
end
