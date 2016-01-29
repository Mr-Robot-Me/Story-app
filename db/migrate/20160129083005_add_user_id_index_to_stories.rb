class AddUserIdIndexToStories < ActiveRecord::Migration
  def change
  	add_index :stories, :user_id
  end
end
