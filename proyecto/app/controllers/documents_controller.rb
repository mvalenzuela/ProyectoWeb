class DocumentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :ajaxFunction]
  before_action :set_document, only: [:show, :edit, :update, :destroy, :edit_permissions]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @is_user_logged_in = user_signed_in?
    @show_editable_documents = params[:show_editable_documents]
    if params[:title]
      @documents = @documents.where("lower(title) like ?", "%#{params[:title]}%")
    end
    if @is_user_logged_in and @show_editable_documents
      @documents = current_user.documents
    end
    if !@is_user_logged_in and @show_editable_documents
      @documents = []
    end
  end

  def editable_documents_index
    @documents = Document.all
    @is_user_logged_in = user_signed_in?
    show_editable_documents = params[:show_editable_documents]
    if params[:title]
      @documents = @documents.where("lower(title) like ?", "%#{params[:title]}%")
    end
    if @is_user_logged_in
      puts(current_user)
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    if !@document.public and !user_signed_in?
      redirect_to new_user_session_url
    end
    @users_permited_to_edit = @document.permited_to_edit_users
    @edit_permissions = EditPermission.where("document_id = ?", @document.id)
    @edit_permission = EditPermission.new
    @is_user_signed_in = user_signed_in?

    if @is_user_signed_in
      has_current_user_edit_permission = EditPermission.where("document_id = ? AND user_id = ?", @document.id, current_user.id)
      if has_current_user_edit_permission.length == 0
        @has_current_user_edit_permission = false
      else
        @has_current_user_edit_permission = true
      end
    else
      @has_current_user_edit_permission = false
    end
    #likes custom
    @users_interested = @document.interested_users
    if @users_interested.include?(current_user)
      @is_user_interested_in_current_document = true
    else
      @is_user_interested_in_current_document = false
    end
    @suggestions = Suggestion.where("document_id = ?", @document.id)

  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    users_permited_to_edit = @document.permited_to_edit_users
    if !(users_permited_to_edit.include?(current_user))
      redirect_to action: "index"
    end
    document_raw = @document.text != nil ? @document.text : ''
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @body = markdown.render(document_raw).html_safe
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        editPermission = EditPermission.new()
        editPermission.document_id = @document.id
        editPermission.user_id = current_user.id
        editPermission.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_permissions
    #@document = Document.find_by_id(params[:document_id])
    @users_permited_to_edit = @document.permited_to_edit_users
  end

  # Calls markdown application helper method.
  def get_safe_html
    document_body = params[:document_body]
    document_raw = document_body != nil ? document_body : ''
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @body = markdown.render(document_raw).html_safe
    render :json => { :success => true, :body => @body }
  end

  def ajaxFunction
    valor = params['document_id']
    if Like.exists?(interested_user: current_user.id, liked_document: valor)
      Like.where(interested_user: current_user.id, liked_document: valor).destroy_all
    else
      @Like = Like.new
      @Like.interested_user = current_user
      @Like.liked_document = Document.find(valor)
      @Like.save
    end
    document = Document.find(valor)
    likes = document.interested_users.count
    answer = {"likes" => likes}
    respond_to do |format|
      format.json { render json: answer }  # respond with the created JSON object
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :text, :public, :content)
    end
end
