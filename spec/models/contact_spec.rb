require 'rails_helper'

describe "relationships" do
  it "belongs to a company" do
    contact = Contact.create(name: "Person", position: "boss", email: "dfdfd@company.com")
    expect(contact).to respond_to(:company)
  end
end
