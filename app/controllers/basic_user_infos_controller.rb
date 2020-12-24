class BasicUserInfosController < ApplicationController
  before_action :set_basic_user_info, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /basic_user_infos
  def index
    @basic_user_infos = BasicUserInfo.where(user_id: @user.id)

    render json: @basic_user_infos
  end

  # GET /basic_user_infos/1
  def show
    render json: @basic_user_info
  end

  # POST /basic_user_infos
  def create
    @basic_user_info = BasicUserInfo.new(basic_user_info_params)
    @basic_user_info.id = @user.id

    if @basic_user_info.save
      render json: @basic_user_info, status: :created, location: @basic_user_info
    else
      render json: @basic_user_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /basic_user_infos/1
  def update
    if @basic_user_info.update(basic_user_info_params)
      render json: @basic_user_info
    else
      render json: @basic_user_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /basic_user_infos/1
  def destroy
    @basic_user_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_user_info
      @basic_user_info = BasicUserInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basic_user_info_params
      params.require(:basic_user_info).permit(:birthdate, :pronoun, :username, :country, :about_me, :user_id)
    end
end
