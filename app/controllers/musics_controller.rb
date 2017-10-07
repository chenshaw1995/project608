class MusicsController < ApplicationController
  include SessionsHelper
  before_action :set_music, only: [:show, :edit]#, :update, :destroy]

  # GET /musics
  # GET /musics.json
  public
  def index
    
if(params[:like])
 @like= Like.new(music_id:params[:like], user_id:current_user[:id])
  redirect_to like_path(@like)
end
    @musics = Music.paginate(page: params[:page])

    #@musics = Music.all
    #@user_id=session[:user_id]
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @music = Music.find(params[:id])
  end

  def byuserid
 #@musics=Music.find_by_(session[:user_id])
  end
  # GET /musics/new
  def new
    @music = Music.new
  end

  # GET /musics/1/edit
  def edit
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(music_params)

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Music was successfully created.' }
        format.json { render :show, status: :created, location: @music }
      else
        format.html { render :new }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    #
    @music.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: 'Music was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      
      @music = Music.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_params
      params.require(:music).permit(:name, :artist)
    end
end
