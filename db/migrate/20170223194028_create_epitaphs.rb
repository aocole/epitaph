class CreateEpitaphs < ActiveRecord::Migration[5.0]
  def change
    create_table :epitaphs do |t|
      t.integer :user_id
      t.string :slug
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
