class LocationsController < ApplicationController
 before_action :set_location, only: [:show, :edit, :update, :destroy] 
 before_action :authorize

  def destroy
  	@site = @location.site
    @location.destroy
    respond_to do |format|
      format.html { redirect_to edit_site_path(@site), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def show

  end
  

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location= Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name,:island,:city,:street,:lat, :long)
    end


end
