class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :home_team, references: :teams, foreign_key: { to_table: :teams }, null: false
      t.references :guest_team, references: :teams, foreign_key: { to_table: :teams }, null: false
      t.datetime :match_date, null: false

      t.timestamps
    end
  end
end
