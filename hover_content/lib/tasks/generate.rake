namespace :generate do

  desc "generates random contacts"
  task(:contacts => :environment) do
    5.times do
      Contact.create(:first_name => NameForgery.first_name, 
                     :last_name => NameForgery.last_name,
                     :address => AddressForgery.street_address,
                     :zip => AddressForgery.zip,
                     :city => AddressForgery.city,
                     :state => AddressForgery.state_abbrev,
                     :phone_number => AddressForgery.phone,
                     :fax_number => AddressForgery.phone)
    end
  end
  
end
