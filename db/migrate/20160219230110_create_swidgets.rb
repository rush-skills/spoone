class CreateSwidgets < ActiveRecord::Migration
  def change
    create_table :swidgets do |t|
      t.string :name
      t.references :widget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
