class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, id: false do |t|
      t.binary :uuid, limit: 16, primary_key: true, unique: true
      t.string :comment
      t.integer :counter, unsigned: true, default: 0

      t.timestamps
    end
  end
end
