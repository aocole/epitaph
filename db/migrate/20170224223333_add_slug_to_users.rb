class AddSlugToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :epitaphs, :slug, :string
    add_column :users, :slug, :string
    User.all.each &:save
  end
end
