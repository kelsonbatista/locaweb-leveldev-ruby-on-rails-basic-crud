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
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_topic
  end

  def update
    find_topic
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_topic
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:id, :title)
  end

  def find_topic
    @topic = Topic.find_by(id: params[:id])
  end
end
