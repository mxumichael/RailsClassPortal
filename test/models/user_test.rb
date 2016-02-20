require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do #this test should always return true. testing the test framework.
     assert true
  end

  test "create a user improper parameters" do
    assert_raise (StandardError){
      tempuser1 = User.new("name","email@email.com",true,false,false,nil)
    }
  end

  test "two users one email address" do
    assert_raise (StandardError){
      tempuser1 = User.new("name","email@email.com",true,false,false,nil)
      tempuser2 = User.new("name","email@email.com",true,false,false,nil)
    }
  end

end
