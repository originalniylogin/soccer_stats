class CreateStatisticsTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics_types do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :description

      t.timestamps
    end
  end
end
