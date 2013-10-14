class CreateCardViews < ActiveRecord::Migration
  def change
    create_table :card_views do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :view_count, :default => 0
      t.integer :pass_count, :default => 0
      t.integer :fail_count, :default => 0
      t.integer :urgency, :default => 0

      t.timestamps
    end
    add_index :card_views, :user_id
    add_index :card_views, :card_id
    add_index :card_views, [:card_id, :user_id], :unique => true
  end
end
