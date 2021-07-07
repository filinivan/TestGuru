class TestsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_test, only: %i[edit destroy show start]
    before_action :set_user, only: %i[start]

    def index
      @tests = Test.all
    end

    def show
      @questions = @test.questions
    end

    def edit
    end

    def new
      @test = Test.new
    end

    def create
      @test = Test.new(test_params)
      if @test.save
        redirect_to @test
      else 
        render :new
      end
    end 

    def destroy
      @test.destroy
    
      redirect_to tests_path
    end

    def update
      @test = Test.find(params[:id])

      if @test.update(test_params)
        redirect_to @test
      else 
        render :edit
      end  
    end 

    def start
      @user.tests.push(@test)
      redirect_to @user.test_passage(@test)
    end

    private

    def set_user
      @user = User.first
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id, :user_id)
    end

    def find_test
      @test = Test.find(params[:id])    
    end
end
