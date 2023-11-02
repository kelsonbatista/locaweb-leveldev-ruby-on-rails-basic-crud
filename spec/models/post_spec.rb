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

    it { should validate_presence_of(:title) }

    it { should validate_length_of(:title).is_at_least(3) }

  end
end
