class GroupController < ApplicationController
  before_action :authenticate_user!


  # 新規グループ作成画面
  def new
    @group = Group.new
  end

  # 新規グループ作成ロジック・作成完了画面
  def create
    require 'securerandom'
    @group = Group.new(group_params)
    @group.code = SecureRandom.hex(8)

    if @group.save
      @group_user = GroupUser.new
      @group_user.user_id = current_user.id
      @group_user.group_id = @group.id
      @group_user.role = 'owner'
      @group_user.save

      redirect_to @group, notice: 'グループを作成しました'
    else
      render :new, notice: 'グループを作成できませんでした'
    end
    
  end

  # グループ詳細画面
  def show
    @group = Group.find(params[:id])
    @group_users = @group.group_users
  end

  # 所属グループ一覧画面
  def list
    @group_users = current_user.group_users

  end

  # グループ編集画面
  def edit

  end

  # グループ削除画面
  def destroy

  end

  # グループ参加画面
  def join
    code = params[:code]
    @group = Group.find_by_code(code)

  end

  private
  def group_params
    params.require(:group).permit(:name, :code)
  end
end
