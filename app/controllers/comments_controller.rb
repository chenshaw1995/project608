class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
before_action :logged_in?
 include SessionsHelper
  # GET /comments
  # GET /comments.json
  def index
    if(params[:music_id]) then
    @ids=Comment.where(music_id:params[:music_id]).ids
    elsif logged_in?
     @ids=Comment.where(user_id: current_user[:id]).ids
    else 
      @comments=Comment.joins(:author,:commenton)
    #@ids=Author.where(user_id: current_user[:id]).ids
    end
  @comments = Comment.where(id:@ids)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        Author.find_or_create_by(comment_id: params[:id])do |c|
        c.user_id= params[:user_id]
        end
        Commenton.find_or_create_by(comment_id: params[:id])do |c|
        c.music_id= params[:music_id]
        end
        redirect_to @comment, notice: 'Comment was successfully created.' 
      else
        format.html { render :new }
      end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :body,:music_id, :user_id)
    end
    
end
