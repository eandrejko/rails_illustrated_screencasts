class ImagesController < ApplicationController
  
  def index
    @images = Image.find(:all)
    # generate a unique id for the upload
    @uuid = (0..29).to_a.map {|x| rand(10)}
  end
  
  def create
    @image = Image.new(params[:image])
    respond_to do |wants|
      if @image.save
        flash[:notice] = 'Image was successfully created.'
        wants.html { redirect_to(:action => 'index') }
      else
        wants.html { redirect_to(:action => 'index') }
      end
    end
  end

end
