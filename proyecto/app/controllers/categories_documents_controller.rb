class CategoriesDocumentsController < ApplicationController
  before_action :set_categories_document, only: [:show, :edit, :update, :destroy]

  # GET /categories_documents
  # GET /categories_documents.json
  def index
    @categories_documents = CategoriesDocument.all
  end

  # GET /categories_documents/1
  # GET /categories_documents/1.json
  def show
  end

  # GET /categories_documents/new
  def new
    @categories_document = CategoriesDocument.new
  end

  # GET /categories_documents/1/edit
  def edit
  end

  # POST /categories_documents
  # POST /categories_documents.json
  def create
    @categories_document = CategoriesDocument.new(categories_document_params)

    respond_to do |format|
      if @categories_document.save
        format.html { redirect_to @categories_document, notice: 'Categories document was successfully created.' }
        format.json { render :show, status: :created, location: @categories_document }
      else
        format.html { render :new }
        format.json { render json: @categories_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_documents/1
  # PATCH/PUT /categories_documents/1.json
  def update
    respond_to do |format|
      if @categories_document.update(categories_document_params)
        format.html { redirect_to @categories_document, notice: 'Categories document was successfully updated.' }
        format.json { render :show, status: :ok, location: @categories_document }
      else
        format.html { render :edit }
        format.json { render json: @categories_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_documents/1
  # DELETE /categories_documents/1.json
  def destroy
    @categories_document.destroy
    respond_to do |format|
      format.html { redirect_to categories_documents_url, notice: 'Categories document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_document
      @categories_document = CategoriesDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_document_params
      params.require(:categories_document).permit(:category_id, :document_id)
    end
end
