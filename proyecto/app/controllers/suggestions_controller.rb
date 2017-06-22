class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
  end

  # GET /suggestions/new
  def new
    @document = Document.find(params[:document_id])
    @suggestion = Suggestion.new
    document_raw = @document.text != nil ? @document.text : ''
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @body = markdown.render(document_raw).html_safe
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    @suggestion.status = 'Pending'
    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to document_path(suggestion_params[:document_id]), notice: 'Suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        puts('--------------------------------------')
        format.html { redirect_to root_path, notice: @suggestion.errors  }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Reject suggestion updating status
    def implement
      @suggestion.status = 'Implemented'
    end

    # Reject suggestion updating status
    def refect
      @suggestion.status = 'Rejected'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:document_id, :text)
    end
end
