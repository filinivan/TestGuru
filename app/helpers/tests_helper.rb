module TestsHelper
  
  TEST_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze 

  def test_level(test)
     TEST_LEVELS[test.level] || :hero 
  end

  def question_header(test)
    if test.persisted?
      text = "Edit " + test.title + " Question"
    else 
      text = "Create New " + test.title = " Question"
    end
    return text
  end

  def current_year 
    Time.current.year
  end

  def github_url(author, repo)
    link = link_to author, repo
  end
end
