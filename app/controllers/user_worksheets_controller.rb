class UserWorksheetsController < ApplicationController

  helper_method :user_worksheet, :worksheet
  attr_reader :user_worksheet

  def new
    @user_worksheet = current_user.user_worksheets.new(worksheet_id: params[:worksheet_id])
  end

  def create
    @user_worksheet = current_user.user_worksheets.new(user_worksheet_params)
    if user_worksheet.save
      flash[:notice] = 'Saved answers!'
      # TODO: need to replace this redirect path
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user_worksheet = current_user.user_worksheets.find(params[:id])
  end

  def update
    @user_worksheet = current_user.user_worksheets.find(params[:id])
    if user_worksheet.update_attributes(user_worksheet_params)
      flash[:notice] = 'Saved answers!'
      # TODO: need to replace this redirect path
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_worksheet_params
    params.require(:user_worksheet).permit(
      :worksheet_id,
      question_answers_attributes: [:id, :question_id, :description])
  end

  def worksheet
    @worksheet ||= Worksheet.find(params[:worksheet_id])
  end

end
