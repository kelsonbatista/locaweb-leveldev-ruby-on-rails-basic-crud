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
    if @topic
      redirect_to topic_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.update(topic_params)
    redirect_to topic_path(@topic)
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:id, :title)
  end
end
