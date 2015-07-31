class ObjectivesController < ApplicationController
  # TODO: needs admin authorization

  def destroy
    Objective.find(params[:id]).destroy
    render nothing: true
  end

end
