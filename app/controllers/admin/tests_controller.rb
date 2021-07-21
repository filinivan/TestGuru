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
      @test = Test.new(test_params)
      @test.user_id = current_user.id
      if @test.save
        redirect_to admin_tests_path
      else 
        render :new
      end
    end 

    def destroy
      @test.destroy
    
      redirect_to tests_path
    end

    def update
      if @test.update(test_params)
        redirect_to admin_test_path
      else 
        render :edit
      end  
    end 

    def start
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end

    private

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end

    def find_test
      @test = Test.find(params[:id])    
    end
end
