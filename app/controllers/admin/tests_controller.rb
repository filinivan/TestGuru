class Admin::TestsController < Admin::BaseController
    
    before_action :find_test, only: %i[edit destroy show start update]

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
      @test = current_user.created_tests.new(test_params)
      if @test.save
        redirect_to admin_tests_path, notice: t('.success')
      else 
        render :new
      end
    end 

    def destroy
      @test.destroy
    
      redirect_to admin_tests_path
    end

    def update
      if @test.update(test_params)
        redirect_to admin_tests_path
      else 
        render :edit
      end  
    end 

    private

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end

    def find_test
      @test = Test.find(params[:id])    
    end
end
