require "test_helper"

class InterventionStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention_state = intervention_states(:one)
  end

  test "should get index" do
    get intervention_states_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention_state_url
    assert_response :success
  end

  test "should create intervention_state" do
    assert_difference('InterventionState.count') do
      post intervention_states_url, params: { intervention_state: { description: @intervention_state.description } }
    end

    assert_redirected_to intervention_state_url(InterventionState.last)
  end

  test "should show intervention_state" do
    get intervention_state_url(@intervention_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention_state_url(@intervention_state)
    assert_response :success
  end

  test "should update intervention_state" do
    patch intervention_state_url(@intervention_state), params: { intervention_state: { description: @intervention_state.description } }
    assert_redirected_to intervention_state_url(@intervention_state)
  end

  test "should destroy intervention_state" do
    assert_difference('InterventionState.count', -1) do
      delete intervention_state_url(@intervention_state)
    end

    assert_redirected_to intervention_states_url
  end
end
