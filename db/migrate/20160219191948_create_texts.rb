class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.references :widget, index: true, foreign_key: true
      t.text :text
      t.string :name

      t.timestamps null: false
    end
  end
end
