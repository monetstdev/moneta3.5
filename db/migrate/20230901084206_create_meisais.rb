class CreateMeisais < ActiveRecord::Migration[7.0]
  def change
    create_table :meisais do |t|
      t.references :kouza, null: false, foreign_key: true
      t.integer :kubun, default: 0
      t.integer :kingaku
      t.string :tekiyou

      t.timestamps
    end
  end
end
