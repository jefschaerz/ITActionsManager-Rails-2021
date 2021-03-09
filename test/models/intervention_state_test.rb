require "test_helper"

class InterventionStateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save intervention_state without description" do
    intervention_state = InterventionState.new(description:'')
    refute intervention_state.valid?
  end

end


