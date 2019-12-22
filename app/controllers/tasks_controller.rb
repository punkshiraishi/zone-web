class TasksController < ApplicationController
  before_action :login_required
  def index
  end

  def login_required
    redirect_to login_url unless logged_in?
  end
end
