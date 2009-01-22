class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      
      t.string :address
      t.string :zip
      t.string :city
      t.string :state
      
      t.string :phone_number
      t.string :fax_number
      
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
