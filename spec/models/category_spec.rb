require "rails_helper"

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new
        expect(category).to be_invalid
      end

      it "has a unique name" do
        Category.create(title: "Web Development")
        category = Category.new(title: "Web Development")
        expect(category).to be_invalid
      end
    end


    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end
end
