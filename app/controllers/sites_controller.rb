class SitesController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :destroy, :add_location] 
  before_action :authorize, except: [:search, :valid, :hit_it]

  
    def add_location 
    @site.locations.build
    render 'edit'
  end

  def hit_it
    #@site.update_attribute(:hit, @site.hit+1) 
    Site.increment_counter(:hit,params[:id])
    @site=Site.find(params[:id])
    #render 'show'
    redirect_to @site.web
  end


  def search
   #@sites = Site.search(params[:search]).paginate(page: params[:page])
   #@sites = Site.where("category_id='2'")
   #@sites = Site.where("description LIKE %?%", params[:search]).paginate(page: params[:page])
   @sites = Site.search(params[:search])
   render 'index2'
   
  end

  def valid
    @page_title = 'Sites classés'
    @sites = Site.approved.paginate(page: params[:page])
    #render 'index', :layout => 'home_layout'
    render 'index'
  end

  def standby
    @page_title = 'Sites en attente'
    @sites = Site.standbyed.paginate(page: params[:page])
    render 'index'
  end

  def trash
    @page_title = 'Corbeille'
    @sites = Site.trashed.paginate(page: params[:page])
    render 'index'
  end

  def trash_it
    @site=Site.find(params[:id])
    @site.update_attribute(:category_id, 1)   
     redirect_to sites_standby_path
    #@site.trash_it_now

    #@sites=Site.all.paginate(page: params[:page])
    #render 'index'
  end

  def standby_it
    @site=Site.find(params[:id])
    @site.update_attribute(:category_id, 2)   
    redirect_to sites_standby_path   
  end
  
  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all.paginate(page: params[:page])
  end

  # GET /sites/1
  # GET /sites/1.json
  def show


  end

  # GET /sites/new
  def new
    @site = Site.new
    @site.locations.new
  end

  # GET /sites/1/edit
  def edit
    @site=Site.find(params[:id])
    if @site.locations.count == 0
      @site.locations.new
    end

  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to edit_site_path(@site), notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to edit_site_path(@site), notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:web, :title, :description, :kw, :category_id, :facebook,
        locations_attributes: [:id,:name,:island,:city,:street,:lat,:long,:_destroy])

    end
end
