class TopicsController < ApplicationController
  before_action :load_curriculum
  before_action :load_topic, only: [:show, :edit, :update, :destroy]

  def create
    @topic = @curriculum.topics.create(topic_params)
    redirect_to [@curriculum, @topic.parent]
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

  def new
    @topic = Topic.new(:curriculum => @curriculum, :parent_id => params[:parent_id])
  end

  def destroy
    @parent = @topic.parent
    @topic.destroy
    if @parent
      redirect_to curriculum_topics_path(@curriculumn, @parent)
    else
      redirect_to curriculum_path(@curriculumn)
    end
    
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :parent_id)
  end

  def load_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end

  def load_topic
    @topic = @curriculum.topics.find(params[:id])
  end
end
