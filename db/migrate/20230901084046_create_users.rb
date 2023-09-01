class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :kanji_name
      t.string :kana_name
      t.string :password
      t.string :hashed_password
      t.string :email
      t.string :yubin
      t.string :jusho

      t.timestamps
    end
  end
end
