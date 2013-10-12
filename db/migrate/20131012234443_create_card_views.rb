class CreateCardViews < ActiveRecord::Migration
  def change
    create_table :card_views do |t|
      t.int :user_id
      t.int :card_id
      t.int :view_count
      t.int :pass_count
      t.int :fail_count
      t.int :urgency

      t.timestamps
    end
    add_index :card_views, :user_id
    add_index :card_views, :card_id
  end
end
