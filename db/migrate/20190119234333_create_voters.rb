class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
			t.string :vote_preference
			t.string :street_number
			t.string :street_name
			t.string :city
			t.string :state
			t.string :postal_code
			t.string :geocode
			t.string :address_string
 
      t.timestamps
    end
  end
end
