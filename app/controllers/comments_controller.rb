class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]  

    #GET
    def index   
        @comments = Comment.all
    end
    
    #GET
    def show
    end 
  
    #GET /comments/new
    def new 
        @comment = Comment.new
    end 
  
    #GET /comments/1/edit
    def edit
    end 
   
    #POST /comments
    def create
        
        if params[:student_id]
            @student = Student.find(params[:student_id])
            @comment = @student.comments.new(comment_params)
        else
            @comment = Comment.new(comment_params)
        end
        
        #@comment = Comment.new(comment_params)

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
  
    #PUT /comments
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
   
    #DELETE /comments
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
            params.require(:comment).permit(:subject, :content, :userid)
        end
end
