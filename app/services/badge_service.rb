class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    # @user_test_passages = TestPassage.where(user: @user, passed: true)
    @user_test_passages = TestPassage.passed.where(user: @user)
  end

  def call
    Badge.all.each do |badge|
      rule = badge.rule
      value = badge.value
      give_reward(badge) if send(rule, value)
    end
  end

  private

  def rule_first_time(*args)
    TestPassage.where(user: @user, test: @test).length == 1
  end


  def rule_all_in_category(category)
      return false if @test.category.name != category

      all_tests_by_category = Test.by_category(category).order(id: :asc).pluck(:id)
      user_passed = @user_test_passages.distinct.where(test_id: all_tests_by_category).order(test_id: :asc).pluck(:test_id)
      all_tests_by_category == user_passed
  end

  def rule_all_in_level(level_number)
    return false if @test.level != level_number.to_i

    all_tests_by_level = Test.where(level: level_number).order(id: :asc).pluck(:id)
    passed_list = @user_test_passages.distinct.where(test_id: all_tests_by_level).order(test_id: :asc).pluck(:test_id)
    all_tests_by_level == passed_list
  end

  def give_reward(badge)
    @user.badges << badge
  end
end
