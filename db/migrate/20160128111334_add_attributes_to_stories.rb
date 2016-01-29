class AddAttributesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :title, :string
    add_column :stories, :content, :text
  end
end
