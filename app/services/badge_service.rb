class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
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
    # TestPassage.where(["user_id = ? and test_id = ?", @user.id, @test.id]).length == 1
    TestPassage.where(user: @user, test: @test, passed: true)
  end


  def rule_all_in_category(category)
    if @test.category.name == category
      category_id = @test.category.id
      passed_tests_count = @user.tests.where(category: category_id, passed: true).distinct
      Category.find_by(name: category).tests.count == passed_tests_count
    end
  end

  def rule_all_in_level(level_number)
    full_list = Test.where(level: level_number)
    passed_list = @user.tests.where(level: level_number).distinct
    full_list == passed_list
  end

  def give_reward!(badge)
    @user.badges << badge
  end
end
