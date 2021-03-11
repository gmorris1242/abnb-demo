class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|
      t.string :host_number
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :picture_url
      t.string :thumbnail_url
      t.text :about

      t.timestamps
    end
  end
end
