class OrganizationsController < ApplicationController
  before_action :check_user_or_admin, only: [:edit, :update]
  
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    if current_user || current_admin
    @organizations = Organization.all
    @users = User.all
    else
      collection = RGeo::GeoJSON::FeatureCollection.new(
        Organization.all.map do |org|
          RGeo::GeoJSON::Feature.new(
            RGeo::Cartesian.factory.point(org.long, org.lat), org.id, name: org.name, need_count: org.needs.where('enabled = true').count
          )
        end
      )
      render json: RGeo::GeoJSON.encode(collection)
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    if current_user
      @organization = Organization.find(current_user.organization_id)
      @needs = @organization.needs
      @categories = []

      @needs.each do |need|
        if !@categories.include? need.category
          @categories.push(need.category)
        end
      end
    elsif current_admin
      @organization = Organization.find(params[:id])
      @needs = @organization.needs
      @categories = []

      @needs.each do |need|
        if !@categories.include? need.category
          @categories.push(need.category)
        end
      end
    else 
      @organization = Organization.find(params[:id])
      @address = @organization.address
      @needs = @organization.needs.where('enabled = true').order(:item).includes(@category)
      @categories = []

      @needs.each do |need|
        if !@categories.include? need.category
          @categories.push(need.category)
        end
      end
      render layout: false
    end
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
    end
  end

  private

    # Define who can see what based on user or admin
    def set_organization
      if current_user
        @organization = Organization.find(current_user.organization_id)
      elsif current_admin
        @organization = Organization.find(params[:id])
      end
    end

    # Whitelist parameters
    def organization_params
      params.require(:organization).permit(:name, :description, :address, :poc_name, :phone)
    end

    # Authentication method to protect Organization Edit/Delete functions
    def check_user_or_admin 
      if !current_user && !current_admin 
        redirect_to unauthenticated_root_path, notice: 'Sorry, you must be logged in to view organization pages'
      end 
    end
end
