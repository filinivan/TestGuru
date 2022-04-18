class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @user_test_passages = TestPassage.where(user: @user)
    @test_passage = test_passage
    @tests = Test.all
  end

  def call
    Badge.all.each do |badge|
      rule = badge.rule
      value = badge.value
      give_reward!(badge) if send(rule, value)
    end
  end

  private

  def rule_first_time(*args)
    TestPassage.where(["user_id = ? and test_id = ?", @user.id, @test.id]).length > 1
  end


  def rule_all_in_category(category)
    if @test_passage.test.category.name == category
      correct_answer_count = TestPassage.passed_tests_correct(@user)
                              .pluck('DISTINCT test_id')
                              .count
      Category.find_by(name: category).tests.count == correct_answer_count
    end
  end

  def rule_all_in_level(level_number)
    full_list = Test.where(level: level_number)
    # passed_list = @user.tests.where(level: level_number, result: true).distinct
    passed_lsit = @user_test_passages.distinct.where(test_id: full_list,
                              result: true).order(test_id: :asc).pluck(:test_id)
    full_list == passed_list
  end

  def give_reward!(badge)
    @user.badges << badge
  end
end
