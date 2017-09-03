require 'rails_helper'

describe "relationships" do
  it "belongs to a company" do
    comment = Comment.create(content: "Something interesting")
    expect(comment).to respond_to(:job)
  end
end
