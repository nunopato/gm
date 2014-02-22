class GadgetImagesController < ApplicationController
  
  def show
    @gadget_image = GadgetImage.find params[:id]
  end

  def create    
    @gadget = Gadget.find params[:gadget_id]
    @gadget_image = @gadget.gadget_images.build     
    @gadget_image = GadgetImage.new(gadget_image_params) do |t|
      if params[:gadget_image][:data]
        t.data      = params[:gadget_image][:data].read
        t.filename  = params[:gadget_image][:data].original_filename
        t.mime_type = params[:gadget_image][:data].content_type
        t.gadget_id = @gadget.id
      end
    end
        
    if @gadget_image.save
      redirect_to @gadget_image.gadget
    else
      render :action => "new"
    end
  end

  def send_image        
    @gadget_image = GadgetImage.find params[:id]
    send_data @gadget_image, :type => 'image/png', :disposition => 'inline'
  end

  private

  def gadget_image_params
    params.require(:gadget_image).permit(:name, :filename, :mime_type)
  end

end