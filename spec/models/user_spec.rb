require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end

    it "is not valid without a password" do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com"
      )
      expect(user).to_not be_valid
    end

    it "is not valid with a password that is too short" do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "short",
        password_confirmation: "short"
      )
      expect(user).to_not be_valid
    end

    it "is not valid with a password and password_confirmation mismatch" do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "mismatch"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid with a non-unique email (case-insensitive)" do
      User.create(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "TEST@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a first name" do
      user = User.new(
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a last name" do
      user = User.new(
        first_name: "John",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
    end

    it "authenticates with valid email and password" do
      authenticated_user = User.authenticate_with_credentials("test@example.com", "password")
      expect(authenticated_user).to eq(@user)
    end

    it "does not authenticate with an incorrect password" do
      authenticated_user = User.authenticate_with_credentials("test@example.com", "wrong_password")
      expect(authenticated_user).to be_nil
    end

    it "does not authenticate with an incorrect email" do
      authenticated_user = User.authenticate_with_credentials("wrong_email@example.com", "password")
      expect(authenticated_user).to be_nil
    end

    it "authenticates with email containing leading/trailing whitespaces" do
      authenticated_user = User.authenticate_with_credentials("  test@example.com  ", "password")
      expect(authenticated_user).to eq(@user)
    end

    it "authenticates with email containing leading/trailing whitespaces and mixed case" do
      authenticated_user = User.authenticate_with_credentials("  TeSt@eXaMpLe.CoM  ", "password")
      expect(authenticated_user).to eq(@user)
    end
  end
end
