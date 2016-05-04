class PinsController < ApplicationController
	

	def index
		@pins = Pin.all
	end

	def show
		@pin = Pin.find(params[:id])
	end

	def new
		@pin = Pin.new
	end

	def edit
		@pin = Pin.find(params[:id])
	end

	def create
		@pin = Pin.new(pin_params)
		@pin.update_attribute("user", current_user)
		@pin.save
		render :show
	end

	def update
		respond_to do |format|
	      	if @pin.update(pin_params)
	      		format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
				format.json { render :show, status: :ok, location: @pin }
	      	else
	        		format.html { render :edit }
	        		format.json { render json: @pin.errors, status: :unprocessable_entity }
	      	end
	    	end
	end

	def destroy
		@pin = Pin.find(params[:id])
		@pin.destroy
		respond_to do |format|
			format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def your_pins
	end

	def user_pins
		@user = User.find(params[:id])
	end

end


private



	def pin_params
		params.require(:pin).permit(:image, :title, :description)
	end