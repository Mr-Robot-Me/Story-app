class StoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :find_story, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  	@stories = Story.all.order("created_at DESC")
  end

  def show
  end

  def new
  	@story = current_user.stories.new
  end

  def edit
  end

  def create
  	@story = current_user.stories.new(story_params)
  	if @story.save
  		redirect_to @story, notice: 'Pin was successfully created.'
  	else
  		render action: 'new'
  	end
  end

  def update
  	if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
  	@story.destroy
    redirect_to stories_url
  end

  private

  def set_story
  	@story = Story.find(params[:id])
  end

  def find_story
    @story = Story.find(params[:id])
  end

  def correct_user
  	@story = current_user.stories.find_by(id: params[:id])
    redirect_to stories_path, notice: "Not authorized to edit this story" if @story.nil?
  end

  def story_params
    params.require(:story).permit(:title, :content)    
  end
end
