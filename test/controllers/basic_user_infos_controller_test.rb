require "test_helper"

class BasicUserInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_user_info = basic_user_infos(:one)
  end

  test "should get index" do
    get basic_user_infos_url, as: :json
    assert_response :success
  end

  test "should create basic_user_info" do
    assert_difference('BasicUserInfo.count') do
      post basic_user_infos_url, params: { basic_user_info: { about_me: @basic_user_info.about_me, birthdate: @basic_user_info.birthdate, country: @basic_user_info.country, email: @basic_user_info.email, pronoun: @basic_user_info.pronoun, user_id: @basic_user_info.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show basic_user_info" do
    get basic_user_info_url(@basic_user_info), as: :json
    assert_response :success
  end

  test "should update basic_user_info" do
    patch basic_user_info_url(@basic_user_info), params: { basic_user_info: { about_me: @basic_user_info.about_me, birthdate: @basic_user_info.birthdate, country: @basic_user_info.country, email: @basic_user_info.email, pronoun: @basic_user_info.pronoun, user_id: @basic_user_info.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy basic_user_info" do
    assert_difference('BasicUserInfo.count', -1) do
      delete basic_user_info_url(@basic_user_info), as: :json
    end

    assert_response 204
  end
end
