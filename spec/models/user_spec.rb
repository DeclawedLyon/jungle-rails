require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "must be created with password and password_confirmation field" do
    @user = User.new(name: 'test user', email: "test@email.com", password: "TEST", password_confirmation: "TEST")      
    @user.save!
    expect(@product.errors.full_messages).to include("Please confirm your password")
  end

  it "emails must be unique" do
    expect(@product.errors.full_messages).to include("Email address already in use")
  end

  it "saves when required fields (email, first name, and last name) are provided" do
    expect(@product.errors.full_messages).to include("Please fill in required fields")
  end

end
