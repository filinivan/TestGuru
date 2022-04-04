class Admin::BadgeController < ApplicationController
  layout "admin"

  def index
    @badge = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    badge = Badge.new(badge_params)
    if badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_badge_path(@question.test)
    # redirect_to [:admin, @question.test]
  end
end
