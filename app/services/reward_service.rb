class RewardService
  def initialize(test_passage)
    user = test_passage.user
    test = test_passage.test
  end

  def call
    @client.create_gist(gist_params)
  end

  def rule_first_time

  end

  def rule_all_in_category

  end

  def rule_all_in_level

  end

  private


end
