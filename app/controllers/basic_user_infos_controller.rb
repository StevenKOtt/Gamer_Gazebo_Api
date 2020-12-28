class BasicUserInfosController < ApplicationController
  before_action :set_basic_user_info, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /basic_user_infos
  def index
    @basic_user_infos = BasicUserInfo.where(user_id: @user.id)

    render json: @basic_user_infos
  end

  # GET /search/keyword
  def search
    @basic_user_infos = BasicUserInfo.all.with_attached_image.where("lower(username) LIKE ?", "%#{params[:keyword].downcase}%")
    @basic_user_infos = @basic_user_infos.map do |aUser|
      image = rails_blob_path(aUser.image)
      {birthdate: aUser.birthdate, pronoun: aUser.pronoun, username: aUser.username, country:aUser.country, about_me:aUser.about_me, user_id: aUser.user_id, image: image}
    end
    render json: @basic_user_infos
  end
  # GET /basic_user_infos/1
  def show
    image = rails_blob_path(@basic_user_info.image)
    render json: {birthdate: @basic_user_info.birthdate, pronoun: @basic_user_info.pronoun, username: @basic_user_info.username, country:@basic_user_info.country, about_me:@basic_user_info.about_me, user_id: @basic_user_info.user_id, image: image}
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

  # PATCH/PUT /basic_user_infos/image
  def update
    if @basic_user_info.update(image: params[:image])
      image = rails_blob_path(@basic_user_info.image)
      puts image
      render json: {birthdate: @basic_user_info.birthdate, pronoun: @basic_user_info.pronoun, username: @basic_user_info.username, country:@basic_user_info.country, about_me:@basic_user_info.about_me, user_id: @basic_user_info.user_id, image: image}
    else
      render json: @basic_user_info.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @basic_user_info.update(basic_user_info_params)
  #     image = rails_blob_path(@basic_user_info.image)
  #     render json: {birthdate: @basic_user_info.birthdate, pronoun: @basic_user_info.pronoun, username: @basic_user_info.username, country:@basic_user_info.country, about_me:@basic_user_info.about_me, user_id: @basic_user_info.user_id, image: image}
  #   else
  #     render json: @basic_user_info.errors, status: :unprocessable_entity
  #   end
  # end

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
      params.require(:basic_user_info).permit(:birthdate, :pronoun, :username, :country, :about_me, :user_id, :image)
    end
end
