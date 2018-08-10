# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do

  it "is valid" do
    valid_post = build(:post)
    expect(valid_post).to be_valid
  end

  it "is invalid without a title" do
    missing_title = build(:post, title: "")
    expect(missing_title).to be_invalid
  end

  it "is invalid with too short content" do
    short_content = build(:post, content: "l")
    expect(short_content).to be_invalid
  end

  it "is invalid with a long summary" do
    long_summary = build(:post, summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus, nulla vel condimentum ornare, arcu lorem hendrerit purus, ac sagittis ipsum nisl nec erat. Morbi porta sollicitudin leo, eu cursus libero posuere ac. Sed ac ultricies ante. Donec nec nulla ipsum. Nunc eleifend, ligula ut volutpat.")
    expect(long_summary).to be_invalid
  end

  it "is invalid with a category outside the choices" do
    invalid_cat = build(:post, category: "horseshoe")
    expect(invalid_cat).to be_invalid
  end

  it "is invalid if not clickbait" do
    non_clickbait = build(:post, title: "Not a valid title dude")
    expect(non_clickbait).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end
end
