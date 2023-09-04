class CreateKouzas < ActiveRecord::Migration[7.0]
  def change
    create_table :kouzas do |t|
      t.string :bank_bangou
      t.string :shiten_bangou
      t.references :user, null: false, foreign_key: true
      t.integer :kinyu_shohin, default: 0
      t.string :bangou
      t.integer :zandaka

      t.timestamps
    end
  end
end
