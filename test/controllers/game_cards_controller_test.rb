require "test_helper"

class GameCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_card = game_cards(:one)
  end

  test "should get index" do
    get game_cards_url, as: :json
    assert_response :success
  end

  test "should create game_card" do
    assert_difference('GameCard.count') do
      post game_cards_url, params: { game_card: { currently_playing: @game_card.currently_playing, references: @game_card.references, screenname: @game_card.screenname, type: @game_card.type } }, as: :json
    end

    assert_response 201
  end

  test "should show game_card" do
    get game_card_url(@game_card), as: :json
    assert_response :success
  end

  test "should update game_card" do
    patch game_card_url(@game_card), params: { game_card: { currently_playing: @game_card.currently_playing, references: @game_card.references, screenname: @game_card.screenname, type: @game_card.type } }, as: :json
    assert_response 200
  end

  test "should destroy game_card" do
    assert_difference('GameCard.count', -1) do
      delete game_card_url(@game_card), as: :json
    end

    assert_response 204
  end
end
