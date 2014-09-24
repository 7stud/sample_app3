require 'spec_helper'

describe User do

  before(:each) { @user = User.new(
    name: 'Example User', 
    email: "user@example.com",
    password: "foobar",
    password_confirmation: 'foobar',
  )}

  subject { @user }

  it { should be_valid }  #Checks validations in User model

  it { should respond_to(:name) }
 
  describe 'when name is not present' do
    before(:each) { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before(:each) { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  it { should respond_to(:email) }

  describe 'when email is not present' do
    before(:each) { @user.email = '  ' }
    it { should_not be_valid }
  end

  describe 'when email format is INvalid' do
    it 'should be invalid' do
      addresses = %w[
        user@foo,com 
        user_at_foo.org 
        example.user@foo. 
        foo@bar_baz.com 
        foo@bar+baz.com
        foo@bar..com]

      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
        #it {should_not be_valid }
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[
        user@foo.COM
        A_US-ER@f.b.org
        frst.lst@foo.jp
        a+b@baz.cn]

      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid 
      end
    end
  end

  describe 'when email address is already taken' do
    before(:each) do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe 'when password is not present' do
    before(:each) do
      @user.password = ' '
      @user.password_confirmation = ' '
    end

    it { should_not be_valid }
  end

  describe 'when password does not match confirmation' do
    before { @user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  it { should respond_to(:authenticate) }

  describe "return value of authenticate" do
    before(:each) { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe 'with valid password' do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe 'with invalid password' do
      let(:user_with_invalid_password) { found_user.authenticate('invalid') }
      it { should_not eq user_with_invalid_password }
      specify { expect(user_with_invalid_password).to be_false }
    end

  end

  describe 'with a password that is too short' do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should_not be_valid }
  end

  describe 'with email that is mixed case' do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lowercase" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end
    

end