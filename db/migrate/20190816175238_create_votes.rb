class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :dish, index: true
      t.references :user, index: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
