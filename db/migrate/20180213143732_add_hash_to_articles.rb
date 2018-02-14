class AddHashToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :text_hash, :string
  end
end
