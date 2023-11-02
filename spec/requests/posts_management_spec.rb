require "rails_helper"

# frozen_string_literal: true

RSpec.describe "Post Management" do
  it "creates a post" do
    post "/posts", params: {
      post: {
        title: "My first post",
        body: "This is my first post"
      }
    }
    expect(response).to redirect_to(post_url(Post.last.id))
  end

  it 'returns a post' do
    Post.create! title: 'My first post', body: 'This is my first post'
    get "/posts/1", headers: { "Accept" => "application/json" }
    json = JSON.parse(response.body)

    expect(json['title']).to eq 'My first post'
    expect(json['body']).to eq 'This is my first post'
  end
end
