class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.string :title
      t.references :dish, index: true

      t.timestamps
    end
  end
end
