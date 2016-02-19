class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :widget, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
