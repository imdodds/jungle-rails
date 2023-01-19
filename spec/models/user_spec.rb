require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should validate user given correct input" do
      @user = User.new(
        name: 'Ian',
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(@user).to be_valid
    end

    it "should invalidate user given passwords do not match" do
      @user = User.new(
        name: 'Ian',
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test456'
      )
      expect(@user).to_not be_valid
    end

    it "should invalidate user given no email" do
      @user = User.new(
        name: 'Ian',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(@user).to_not be_valid
    end

    it "should invalidate user given no name" do
      @user = User.new(
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(@user).to_not be_valid
    end

    it "should invalidate user given duplicate email" do
      @user1 = User.new(
        name: 'Ian',
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      @user1.save
      puts @user1.errors.full_messages

      @user2 = User.new(
        name: 'Ian2',
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(User.find_by(name: 'Ian2')).to be_nil
    end

    it "should invalidate user given duplicate email despite different cases" do
      @user1 = User.new(
        name: 'Ian',
        email: 'ian@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      @user1.save
      puts @user1.errors.full_messages

      @user2 = User.new(
        name: 'Ian2',
        email: 'IAN@TEST.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(User.find_by(name: 'Ian2')).to be_nil
    end

    it "should invalidate user if password is too short" do
      @user = User.new(
        name: 'Ian',
        email: 'ian@test.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user).to_not be_valid
    end
  end
end
