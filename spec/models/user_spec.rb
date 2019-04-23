require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  describe "Validations" do
    it "is valid with correct user registration attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a unique email" do
      @user.save
      user2 = User.new(
        first_name: "first_name2",
      last_name: "last_name2",
      email: "email@email.com",
      password: "password2",
      password_confirmation: "password2"
      )
      expect(user2).to_not be_valid
    end

    it "is not valid without a unique email, and is not case-sensitive" do
      @user.save
      user2 = User.new(
        first_name: "first_name2",
      last_name: "last_name2",
      email: "EMAIL@EMAIL.com",
      password: "password2",
      password_confirmation: "password2"
      )
      expect(user2).to_not be_valid
    end

    it "is not valid if password and password confirmation don't match" do
      @user.password_confirmation = "PASSWORD"
      expect(@user).to_not be_valid
    end

    it "is not valid if password is less than 5 characters" do
      @user.password = "pass"
      @user.password_confirmation = "pass"
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "returns true if correct credentials" do
      @user.save
      login = User.authenticate_with_credentials("email@email.com", "password")
      expect(login).to be true
    end

    it "returns false if no password is entered" do
      @user.save
      login=User.authenticate_with_credentials("email@email.com","")
      expect(login).to be false
    end
    
    it "is not valid if email has whitespace around it" do
      @user.save
      login = User.authenticate_with_credentials("      email@email.com", "password")
      expect(login).to be true
    end

    it "return true if password is correct and email is in the wrong case" do
      @user.save
      login = User.authenticate_with_credentials("EMAIL@email.com", "password")
      expect(login).to be true
    end
  end

end
