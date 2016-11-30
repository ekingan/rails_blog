class InitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.timestamps
      t.string :location
      t.string :tag
    end

    create_table :categories do |t|
      t.string :name
    end

    create_table :comments do |t|
      t.string :body
      t.timestamps
    end

    add_reference :comments, :post, index: true
    add_reference :comments, :user, index: true
    add_reference :posts, :user, index: true
    add_reference :posts, :category, index: true

  end
end
