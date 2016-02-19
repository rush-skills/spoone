class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.references :widget, index: true, foreign_key: true
      t.string :text

      t.timestamps null: false
    end
  end
end
