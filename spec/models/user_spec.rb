require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.new
      @user.first_name = 'souris'
      @user.last_name = 'jolie'  
      @user.email = 'souris@gmail.com'
      @user.password = 'fromagesss'
      @user.password_confirmation = 'fromagesss'
      @user.save
    end
    
    describe "initialized in before(:each)" do
      
      it 'should have a first name' do
        @user.first_name = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'should have a last name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'should have an email' do
        @user.email = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "requires a unique email" do
        @user2 = User.new
        @user2.first_name = 'souris'
        @user2.last_name = 'jolie'  
        @user2.email = 'Souris@gmail.com'
        @user2.password = 'fromagesss'
        @user2.password_confirmation = 'fromagesss'
        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      
      it 'should have a password' do
        @user.password = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'should have a password with 10 characters minimum' do
        @user.password = 'ab'
        @user.password_confirmation = 'ab'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 10 characters)")
      end

      it 'should have same password and password confirmation' do
        @user.password_confirmation = 'saucisson'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'should authenticated an email with spaces before or after' do
        @user.email = '   souris@gmail.com'
        expect(@user).to be_valid
        
      end

      it 'should authenticated an email without case sensitive' do
        @user.email = 'SOURIS@gmail.com'
        expect(@user).to be_valid

      end


    end
  end
end    
