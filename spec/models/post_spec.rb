require "rails_helper"

# frozen_string_literal: true

describe Post do
  describe "validations" do
    it "should be valid when title is filled" do
      # post = Post.new(title: "My awesome title")
      # expect(post.valid?).to eq(true)
      # expect(post).to be_valid

      subject.title = "My awesome title"
      expect(subject.valid?).to eq(true)
      expect(subject).to be_valid
    end
  end
end