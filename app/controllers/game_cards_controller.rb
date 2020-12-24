class GameCardsController < ApplicationController
  before_action :set_game_card, only: [:show, :update, :destroy]
  before_action :authorized
  # GET /game_cards
  def index
    @game_cards = GameCard.where(user_id: params[:user_id])

    render json: @game_cards
  end

  # GET /game_cards/1
  def show
    render json: @game_card
  end

  # POST /game_cards
  def create
    @game_card = GameCard.new(game_card_params)

    if @game_card.save
      render json: @game_card, status: :created, location: @game_card
    else
      render json: @game_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_cards/1
  def update
    if @game_card.update(game_card_params)
      render json: @game_card
    else
      render json: @game_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_cards/1
  def destroy
    @game_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_card
      @game_card = GameCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_card_params
      params.require(:game_card).permit(:references, :product, :screenname, :currently_playing, :user_id)
    end
end
