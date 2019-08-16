class CreateComponentsDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :components_dishes do |t|
      t.belongs_to :component, index: true
      t.belongs_to :dish, index: true

      t.timestamps
    end
  end
end
