class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :collection_id
      t.text :data

      t.timestamps
    end
  end
end
