class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.string :bangou
      t.string :kanji_name
      t.string :kana_name

      t.timestamps
    end
  end
end
