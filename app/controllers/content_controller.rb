class ContentController < ApplicationController
  before_action :redirect_unless_can_manage_curriculum, except: :show

  def redirect_unless_can_manage_curriculum
    allowed(:manage_curriculum)
  end
end
