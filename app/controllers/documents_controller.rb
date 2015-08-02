class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :find_curriculum
  before_action :find_topic

  # GET /documents
  def index
    @documents = Document.all
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new

    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  def create
    @document = Document.new(
      document_params.merge(topic_id: params[:topic_id]))

    if @document.save
      redirect_to curriculum_topic_document_path(@curriculum, @topic, @document), notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      redirect_to curriculum_topic_document_path(@curriculum, @topic, @document), notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    redirect_to curriculum_topic_url(@curriculum, @topic), notice: 'Document was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def document_params
    params.require(:document).permit(:url, :title)
  end

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
end
