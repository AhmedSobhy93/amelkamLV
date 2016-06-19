class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
# skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
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

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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

  def update_comment
    comment = Comment.find_by_id(params[:id])

    if comment.update_attributes(body: params[:body])
      redirect_to root_path ,notice: 'comment updated successfully'
    else
      redirect_to root_path ,notice: 'comment not updated successfully'
    end
  end

  def add_comment
    price_id = params[:price_id]
    comment_body = params[:comment_body]
    @comment = Comment.new
    @comment.body = comment_body
    @comment.user_id = current_user.id
    @comment.price_id =price_id

    respond_to do |f|

      if @comment.save
        f.html {redirect_to root_path ,notice:'Comment was successfully added'}
      else
        f.html {redirect_to root_path ,notice:'Comment was successfully added'}
      end
    end


  end


#POST api/v1/comment.json
  def apicreate
       @body = params[:body]
       @price_id = params[:price_id]
       @user_id = params[:user_id]

       comment =Comment.new 

       comment.body= @body
       comment.price_id= @price_id
       comment.user_id= @user_id



      respond_to do |format|
        if comment.save
          format.json {render :json => {:status=> "1"} }
        else
          format.json { render :json => {:status=> "2"} }
        end
      end 

    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
