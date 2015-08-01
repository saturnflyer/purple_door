class WorksheetsController < ApplicationController

  helper_method :worksheet
  attr_reader :worksheet

  def new
    @worksheet = current_topic.worksheets.new
  end

  def create
    @worksheet = current_topic.worksheets.new(worksheet_params)
    if worksheet.save
      flash[:notice] = "Worksheet created!"
      redirect_to curriculum_topic_path(current_topic.curriculum_id, current_topic)
    else
      render :new
    end
  end

  def edit
    @worksheet = current_topic.worksheets.find(params[:id])
  end

  def update
    @worksheet = current_topic.worksheets.find(params[:id])
    if worksheet.update_attributes(worksheet_params)
      flash[:notice] = "Worksheet updated!"
      redirect_to curriculum_topic_path(current_topic.curriculum_id, current_topic)
    else
      render :edit
    end
  end

  private

  def worksheet_params
    params.require(:worksheet).permit(
      :summary,
      :title,
      objectives_attributes: [:id, :description],
      questions_attributes: [:id, :description])
  end

  def current_topic
    @current_topic = Topic.find(params[:topic] || params[:worksheet][:topic_id])
  end

end
