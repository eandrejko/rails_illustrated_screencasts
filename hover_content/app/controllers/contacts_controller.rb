class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.find(:all, :order => 'last_name asc, first_name asc')
    @contact_groups = @contacts.in_groups_of(4,false)
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
end
