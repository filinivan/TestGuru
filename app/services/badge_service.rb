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

  def rule_first_time
    TestPassage.where(["user_id = ? and test_id = ?", @user.id, @test.id]).length > 0
  end


  def rule_all_in_category(category)
    if @test_passage.test.category.title == category
      corrects_count = TestPassage.passed_tests_correct(@user)
                              .pluck('DISTINCT test_id')
                              .count
    Category.find_by(title: category).tests.count == corrects_count
    end
  end

  def rule_all_in_level(item)

  end

  def give_reward!(badge)
    @user.rewards << badge
  end
end
