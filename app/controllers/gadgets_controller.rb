class GadgetsController < ApplicationController
  
  def show
    @gadget = Gadget.find params[:id]
    # send_data @gadget.gadget_images, :type => 'image/jpeg',:disposition => 'inline'
  end

  def new
    @user = User.find params[:user_id]
    @gadget = @user.gadgets.build     
  end

  def create
    @user = User.find params[:user_id]
    @gadget = @user.gadgets.build gadget_params
    if @gadget.save
      redirect_to @gadget.user
    else
      render 'new'
    end
  end

  def edit 
    @gadget = Gadget.find params[:id]
    @gadget_image = @gadget.gadget_images.build
  end

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end

end