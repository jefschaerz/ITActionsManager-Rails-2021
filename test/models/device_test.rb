require "test_helper"

class DeviceTest < ActiveSupport::TestCase
   #test "the truth" do
   #  assert true
   #end

  test "should not save device without description" do
    device = Device.new(description:'')
    refute device.valid?
  end
end
