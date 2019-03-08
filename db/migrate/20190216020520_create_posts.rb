class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.text :content
    end
  end
end
