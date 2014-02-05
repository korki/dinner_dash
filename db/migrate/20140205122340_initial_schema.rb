class InitialSchema < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end  

    create_table :items do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :price
      t.text :photo
      t.integer :category_id
    end

    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
    end

    create_table :orders do |t|
      t.string :status
      t.integer :order_total
      t.integer :user_id
      t.timestamps
    end

    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :quantity
    end

    create_table :carts do |t|
      t.string :session_id
      t.integer :user_id
      t.timestamps
    end

  end
end
