class Admin::BadgesController < ApplicationController
  # layout "admin"

  before_action :set_badges, only: %i[index]
  before_action :find_badge, only: %i[edit destroy show update ]

  def index
  end

  def edit
  end

  def new
    @badge = Badge.new
  end

  def create
    badge = Badge.new(badge_params)
    if badge.save
      redirect_to admin_badge_path(badge)
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
    # redirect_to [:admin, @question.test]
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :img, :rule, :value)
  end
end
