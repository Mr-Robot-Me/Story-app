class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user, except: [:index]

  def index
    @users = User.all.order("created_at DESC")
  end

  def show
    @stories = current_user.stories.order("created_at DESC")
   
  end

  def stories
    @stories = @user.stories.order("created_at DESC")
  end

  private

  def set_user
    @user = User.find_by(firstname: params[:id])
  end


end
