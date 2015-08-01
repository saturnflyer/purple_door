class QuestionsController < ApplicationController
  # TODO: needs admin authorization

  def destroy
    Question.find(params[:id]).destroy
    render nothing: true
  end

end
