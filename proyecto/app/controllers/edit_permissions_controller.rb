class EditPermissionsController < ApplicationController
  before_action :set_edit_permission, only: [:show, :edit, :update, :destroy]
  #attr_accessor :document
  before_action :set_document

  # GET /edit_permissions
  # GET /edit_permissions.json
  def index
    @edit_permissions = EditPermission.all
  end

  # GET /edit_permissions/1
  # GET /edit_permissions/1.json
  def show
  end

  # GET /edit_permissions/new
  def new
    @edit_permission = EditPermission.new
  end

  # GET /edit_permissions/1/edit
  def edit

  end

  # POST /edit_permissions
  # POST /edit_permissions.json
  def create
    @edit_permission = EditPermission.new(edit_permission_params)

    respond_to do |format|
      if @edit_permission.save
        format.html { redirect_to @edit_permission, notice: 'Edit permission was successfully created.' }
        format.json { render :show, status: :created, location: @edit_permission }
      else
        format.html { render :new }
        format.json { render json: @edit_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edit_permissions/1
  # PATCH/PUT /edit_permissions/1.json
  def update
    respond_to do |format|
      if @edit_permission.update(edit_permission_params)
        format.html { redirect_to @edit_permission, notice: 'Edit permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_permission }
      else
        format.html { render :edit }
        format.json { render json: @edit_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edit_permissions/1
  # DELETE /edit_permissions/1.json
  def destroy
    @edit_permission.destroy
    respond_to do |format|
      format.html { redirect_to edit_permissions_url, notice: 'Edit permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit_permission
      @edit_permission = EditPermission.find(params[:id])
    end

    def set_document
      @document = Document.find(params[:document_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_permission_params
      document_id = params.require(:edit_permission)[:document]
      params.require(:edit_permission).permit(:document_id, :user_id)
      if document_id
        document = Document.find(documnet_id)
      else
        document = nil
      end
      params.require(:edit_permission).permit().merge(:document => document)
    end
end
