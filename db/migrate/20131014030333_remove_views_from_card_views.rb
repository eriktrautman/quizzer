class RemoveViewsFromCardViews < ActiveRecord::Migration
  def change
    remove_column :card_views, :view_count
  end
end
