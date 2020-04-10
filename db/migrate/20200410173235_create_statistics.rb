class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.references :player, foreign_key: true, null: false
      t.references :match, foreign_key: true, null: false
      t.references :statistics_type, foreign_key: true, null: false
      t.float :score, null: false

      t.timestamps
    end
  end
end
