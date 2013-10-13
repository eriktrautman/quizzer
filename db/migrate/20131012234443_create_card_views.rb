class CreateCardViews < ActiveRecord::Migration
  def change
    create_table :card_views do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :view_count
      t.integer :pass_count
      t.integer :fail_count
      t.integer :urgency

      t.timestamps
    end
    add_index :card_views, :user_id
    add_index :card_views, :card_id
    add_index :card_views, [:card_id, :user_id], :unique => true
  end
end
