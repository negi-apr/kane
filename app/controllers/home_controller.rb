class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # ログイン前トップ
  def index
    if user_signed_in?
      redirect_to :dashboard
    end

  end

  # ダッシュボード
  def dashboard
     @group_users = current_user.group_users
  end

end
