class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.belongs_to :host

      t.string :name
      t.string :localized_city
      t.string :airbnb_listing_id_str
      t.string :picture_url
      t.string :nightly_price_as_guest

      t.timestamps
    end
  end
end
