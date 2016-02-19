class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.boolean :half
      t.integer :position
      t.string :widget_klass

      t.timestamps null: false
    end
  end
end
