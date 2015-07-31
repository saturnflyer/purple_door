class TopicsController < ApplicationController
  before_action :load_curriculum
  before_action :load_topic, only: [:show, :edit, :update]

  def create
    @topic = @curriculum.topics.create(topic_params)
    redirect_to @curriculum
  end

  def show
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@curriculum, @topic]
    else
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def load_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end

  def load_topic
    @topic = @curriculum.topics.find(params[:id])
  end
end
