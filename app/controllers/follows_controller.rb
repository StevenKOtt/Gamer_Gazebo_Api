class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :update, :destroy]
  # GET /follows
  def index
      @follows = Follow.where(user_id: params[:user_id])
     @follows = @follows.map  do |x|
      x.following
      end
    
    @follows = BasicUserInfo.all.with_attached_image.where(user_id: [@follows])
    
    @follows = @follows.map do |aUser|
        image = rails_blob_path(aUser.image)
        {birthdate: aUser.birthdate, pronoun: aUser.pronoun, username: aUser.username, country:aUser.country, about_me:aUser.about_me, user_id: aUser.user_id, image: image}
    end
    render json: @follows
  end

  def followcheck
    @follows = Follow.where(user_id: params[:user_id])
    @follow_id = @follows.map  do |x|
      x.following
      end

    if @follow_id.include?(params[:follow_id].to_i)
      render json: {status: true}
    else
      render json: {status: false}
    end
  end
  # GET /follows/1
  def show
    render json: @follow
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # post "/followings/update"
  def updatefollows
    @follows = Follow.where(user_id: params[:user_id])
    @follow_id = @follows.map  do |x|
      x.following
      end

    if @follow_id.include?(params[:follow_id].to_i)

      @index = @follow_id.index(params[:follow_id].to_i)
      
      @follows[@index].destroy()

      render json: {action: "removed"}
    else 
      @follow = Follow.new do |u|
        u.user_id = params[:user_id].to_i
        u.following = params[:follow_id].to_i
        end
      if @follow.save
        render json: {user_id: @follow.user_id, following: @follow.following, action: "added"}, status: :created, location: @follow
      else
        render json: @follow.errors, status: :unprocessable_entity
      end
    end
  end   
  # DELETE /follows/1
  def destroy
    @follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:user_id, :following)
    end
end
