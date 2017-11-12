class MainpageController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]  
  
    #GET
    def index   
        @students = Student.all
    end
    
    #GET
    def show
    end 
  
    #GET /students/new
    def new 
        @student = Student.new
    end 
  
    #GET /students/1/edit
    def edit
    end 
   
    #POST /students
    def create
        @student = Student.new(student_params)

        respond_to do |format|
            if @student.save
                format.html { redirect_to @student, notice: 'Student was successfully created.' }
                format.json { render :show, status: :created, location: @student }
            else
                format.html { render :new }
                format.json { render json: @student.errors, status: :unprocessable_entity }
            end
        end
    end
  
    #PUT /students
    def update
        respond_to do |format|
            if @student.update(student_params)
                format.html { redirect_to @student, notice: 'Student was successfully updated.' }
                format.json { render :show, status: :ok, location: @student }
            else
                format.html { render :edit }
                format.json { render json: @student.errors, status: :unprocessable_entity }
            end
        end
    end
   
    #DELETE /students
    def destroy
        @student.destroy
        respond_to do |format|
            format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_student
            @student = Student.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def student_params
            params.require(:student).permit(:firstname, :lastname, :birthday, :address, :studentid)
        end
end
