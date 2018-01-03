#The migration file is actually a class named  CreatePosts. When we run the migration, the change method calls the  create_table method.
#create_table takes a block that specifies the attributes we want our table to possess.
class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
