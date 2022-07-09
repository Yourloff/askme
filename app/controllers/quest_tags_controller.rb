class QuestTagsController < ApplicationController
  before_action :set_hashtag

  def show
    @questions = @tag.questions
  end

  def index
    @tags = Tag.all
  end

  private

  def set_hashtag
    @tag = Tag.find_by(name: params[:name])
  end
end
