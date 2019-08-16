class CreateComponentsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :components_products do |t|
      t.belongs_to :component, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
