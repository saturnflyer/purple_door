class TopicsController < ApplicationController
  before_action :load_curriculum
  before_action :load_topic, only: [:show, :edit, :update]

  def create
    if params[:parent_id].nil?
      @topic = @curriculum.topics.create(topic_params)
    else
      @topic = Topic.create(topic_params, :parent_id => params[:parent_id])
    end
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

  def new
    {"parent_id"=>"2", "controller"=>"topics", "action"=>"new", "curriculum_id"=>"1"}
    @topic = Topic.new(:curriculum_id => @curriculum, :parent_id => params[:parent_id])
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
