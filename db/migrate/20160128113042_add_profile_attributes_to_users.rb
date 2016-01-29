class AddProfileAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :occupation, :string
    add_column :users, :hobbies, :string
    add_column :users, :about_me, :string
  end
end
