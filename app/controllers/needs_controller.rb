class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  # GET /needs
  # GET /needs.json
  def index
    if current_admin
      @needs = Need.all
    elsif current_user
      @organization = Organization.find(current_user.organization_id)
      @needs = @organization.needs
    end
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
  end

  # GET /needs/new
  def new
    @need = Need.new
    if current_user
      @need.organization_id = current_user.organization_id
    end
  end

  # GET /needs/1/edit
  def edit
    @need = Need.find(params[:id])
  end

  # POST /needs
  # POST /needs.json
  def create
    @need = Need.new(need_params)

    respond_to do |format|
      if @need.save
        format.html { redirect_to needs_path, notice: 'Need was successfully created.' }
        format.json { render :show, status: :created, location: @need }
      else
        format.html { render :new }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  def enable 
    @need = Need.find(params[:need_id])

    @need.update!(enabled: true)

    render 'replace_button'
  end 

  def disable
    @need = Need.find(params[:need_id])

    @need.update!(enabled: false)

    render 'replace_button'
  end

  # PATCH/PUT /needs/1
  # PATCH/PUT /needs/1.json
  def update
    @need = Need.find(params[:id])
    respond_to do |format|
      if @need.update(need_params)
        format.html { redirect_to needs_path, notice: 'Need was successfully updated.' }
        format.json { render :show, status: :ok, location: @need }
      else
        format.html { render :edit }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    respond_to do |format|
      format.html { redirect_to needs_path, notice: 'Need was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      if current_user
        @organization = Organization.find(current_user.organization_id)
        @needs = @organization.needs
      elsif current_admin
        @needs = Need.all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def need_params
      params.require(:need).permit(:organization_id, :item, :category, :comment, :enabled)
    end
end
