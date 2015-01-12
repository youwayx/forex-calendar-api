class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :impact
      t.string :currency
      t.string :time
      t.string :name
      t.string :actual
      t.string :forecast
      t.string :previous

      t.timestamps null: false
    end
  end
end
