class CreateItems < ActiveRecord::Migration[5.2]
    def change
      create_table :items do |t|
        t.text     :title
        t.text     :description
        t.integer  :price
        t.string   :image

        t.timestamps null: false
      end
    end
  end
