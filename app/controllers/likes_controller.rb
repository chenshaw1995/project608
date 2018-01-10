class LikesController < ApplicationController
  include SessionsHelper
  before_action :set_like, only: [:destroy]
private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
       params.permit(:user_id, :music_id)
    end
public
  # GET /likes
  # GET /likes.json
  def index
    #@like_musics = Like
    #@likes
    @musics = Like.where(user_id: current_user[:id])
    #@user = User.find(current_user[:id])# current_user[:id]
    # @musics = Music.where( @likes }
    #@musics = Music.likes.where("user_id = ?", current_user[:id])#.where("id = ?", @like_musics)
    #where("orders_count = ?", params[:orders]
    #@likes = Like.where(user_id: current_user[:id])#.ids#.all#find_by ##
    # @like_musics= Music.joins(:likes).where(likes:{user_id: current_user[:id]})
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
    
    @like = Like.find(params[:id])
    redirect_to root_url#musics_path#(@like.music_id)
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
    
  end

  # POST /likes,
  # POST /likes.json
  def create
  
      if Like.create(like_params)
        flash[:notice] = "Like was successfully created"
        redirect_to likes_path
      else
        flash[:notice] = "error happened, please try again"
        redirect_to musics_path
      end

  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
end
