class CreateKouzas < ActiveRecord::Migration[7.0]
  def change
    create_table :kouzas do |t|
      t.references :bank, null: false, foreign_key: true
      t.references :shiten, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :kinyu_shohin, default: 0
      t.string :bango
      t.integer :zandaka

      t.timestamps
    end
  end
end
