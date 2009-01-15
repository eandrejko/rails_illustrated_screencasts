class ContactsController < ApplicationController
  
  def index
    respond_to do |wants|
      wants.html do
        @contacts = Contact.paginate(:page => params[:page], :order => 'last_name asc, first_name asc')        
        @page = params[:page] || 1
      end
      wants.js do
        # determine contact that was last
        @last = params[:last].to_i
        @contacts = Contact.paginate(:page =>  @last + 1, :order => 'last_name asc, first_name asc')        
        @page = @last + 1
        
        if @contacts.empty?
          @contacts_count = Contact.count
          render :partial => 'complete'
        else
          render :partial => 'contact', :collection => @contacts, :locals => {:page => @page}
        end
      end
    end
  end
  
end
