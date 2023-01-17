class CreateFwcReports < ActiveRecord::Migration[7.0]
  def change
    create_table :fwc_reports do |t|
      t.string :county
      t.date :date_collected
      t.string :inshore_level
      t.string :offshore_level
      t.string :site_location
      t.string :collector

      t.timestamps
    end
  end
end
