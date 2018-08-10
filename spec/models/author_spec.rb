require 'rails_helper'

RSpec.describe Author, type: :model do
  it "is valid" do
    author = build(:author, name: "Caligula", phone_number: 5553054425)
    expect(author).to be_valid
  end

  it "is invalid with no name" do
    author = build(:author, name: "")
    expect(author).to be_invalid
  end

  it "is invalid with a short number" do
    author = build(:author, phone_number: 758475635)
    expect(author).to be_invalid
  end

  it "is invalid when non-unique" do
    some_author = build(:author, name: "Lauren", phone_number: 3039283748)
    some_author.save
    author = build(:author, name: "Lauren", phone_number: 3039283552)
    expect(author).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:author)).to be_valid
  end
end
