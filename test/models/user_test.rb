require "test_helper"

class UserTest < ActiveSupport::TestCase
   #test "the truth" do
   #  assert true
   #end

  test "should not save user without username" do
    user = User.new(username:"", email:"test@gmail.com", password_digest: BCrypt::Password.create('1234'))
    refute user.valid?
  end

  test "should not save user without valid email" do
    user = User.new(username:"User1", email:"testgmail.com", password_digest: BCrypt::Password.create('1234'))
    refute user.valid?
  end
  
end
