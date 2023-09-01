class CreateShitens < ActiveRecord::Migration[7.0]
  def change
    create_table :shitens do |t|
      t.references :bank, null: false, foreign_key: true
      t.string :bango
      t.string :kanji_name
      t.string :kana_name

      t.timestamps
    end
  end
end
