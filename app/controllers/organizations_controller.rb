class OrganizationsController < ApplicationController
  before_action :check_user_or_admin, exclude: [:destroy]
  
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    @users = User.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    if current_user
      @organization = Organization.find(current_user.organization_id)
      @needs = @organization.needs.order(:item)
    elsif current_admin
      @organization = Organization.find(params[:id])
      @needs = @organization.needs.order(:item)
    end

    # .includes(:category)
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
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      if current_user
        @organization = Organization.find(current_user.organization_id)
      elsif current_admin
        @organization = Organization.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :description, :address, :poc_name, :phone)
    end

    def check_user_or_admin 
      if !current_user && !current_admin 
        redirect_to unauthenticated_root_path, notice: 'Sorry, you must be logged in to view organization pages'
      end 
    end
end
