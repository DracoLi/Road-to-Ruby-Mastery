require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
      :name => "Draco Li", 
      :email => "Irock@draco.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accpet valid email address" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email address" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical to upcase" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr);
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password validations" do
    
    it "should require a password" do
      user = User.new(@attr.merge(:password => "", :password_confirmation => ""))
      user.should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      user = User.new(@attr.merge(:password_confirmation => "f"))
      user.should_not be_valid
    end
    
    it "should reject short password" do
      password = "a" * 5
      user = User.new(@attr.merge(:password => password, :password_confirmation => password))
      user.should_not be_valid
    end
    
    it "should reject long passwords" do
      password = "a" * 41
      user = User.new(@attr.merge(:password => password, :password_confirmation => password))
      user.should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if the password match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      it "should be false if the password don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should return nil on email/password mismatch" do
        wrong_pass_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_pass_user.should be_nil
      end
      it "should return nil for an email adress with no user" do
        no_user = User.authenticate("fasd@da.com", @attr[:password])
        no_user.should be_nil
      end
      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end
end
