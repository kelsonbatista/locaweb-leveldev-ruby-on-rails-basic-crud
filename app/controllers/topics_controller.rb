class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    redirect_to topic_path(@topic)
  end

  private

  def topic_params
    params.require(:topic).permit(:id, :title)
  end
end
