class RewardService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @tests = Test.all
  end

  def call
    Badge.all.each do |badge|
      rule = badge.rule
      value = badge.value
      result = send(rule, value)
      give_reward(badge) if result
    end
  end

  def rule_first_time
    TestPassage.where(["user_id = ? and test_id = ?", @user.id, @test.id]).length > 0
  end

  def rule_all_in_category(item)

  end

  def rule_all_in_level(item)

  end

  private

  def give_reward(badge)
    Reward.new(user_id: user.id, badge_id: badge.id).save
  end
end
