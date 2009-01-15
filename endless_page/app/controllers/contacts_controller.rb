class ContactsController < ApplicationController
  
  def index
    respond_to do |wants|
      wants.html do
        @contacts = Contact.paginate(:page => params[:page], :order => 'last_name asc, first_name asc')        
      end
      wants.js do
        # determine contact that was last
        @last = Contact.find(params[:last])
        @contacts = Contact.find(:all,
                                 :conditions => ['last_name > ? OR (last_name = ? and first_name > ?)', @last.last_name, @last.last_name, @last.first_name],
                                 :limit => 5,
                                 :order => 'last_name asc, first_name asc')
        if @contacts.empty?
          @contacts_count = Contact.count
          render :partial => 'complete'
        else
          render :partial => 'contact', :collection => @contacts
        end
      end
    end
  end
  
end
