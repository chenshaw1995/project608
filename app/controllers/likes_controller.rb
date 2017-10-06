class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
    #@music_id=params[:music_id]
    @like = Like.find(params[:id])
  end

  # GET /likes/new
  def new
    @like = Like.new
    #params[:musicid]=2
   # params[:person_id]=2
    #redirect_to action:"create", music_id:2, person_id:2
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def creat
   # @like = Like.create!(like_params)
   # flash[:notice] = "#{@params[:person]} Likes #{@params[:music]}"
    
   # redirect_to controller:'musics',action:'index'
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to controller:'musics',action:'index', notice: 'Like was successfully created.' }
       format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:music_id, :person_id)
    end
end
