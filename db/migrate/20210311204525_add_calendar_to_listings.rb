class AddCalendarToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :calendar, :json
  end
end
