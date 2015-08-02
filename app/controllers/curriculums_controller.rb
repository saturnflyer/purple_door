class CurriculumsController < ApplicationController
  before_action :load_curriculum, only: [:show, :edit, :update]

  def index
    @curriculums = Curriculum.all
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    @curriculum.save
    redirect_to curriculums_path
  end

  def show
    @topics = @curriculum.topics.top_level
  end

  def edit

  end

  def update
    if @curriculum.update(curriculum_params)
      redirect_to @curriculum
    else
      render :edit
    end
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name)
  end

  def load_curriculum
    @curriculum = Curriculum.find(params[:id])
  end
end
