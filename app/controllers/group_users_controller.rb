class GroupUsersController < ApplicationController
    def create
        # user_idにcurrent_userのidを保存し、group_idにparams[:group_id]を保存してgroup_userを作成
        # groupにネストしているため、params[:group_id]でgroup_idを取得できる
        group_user = current_user.group_users.new(group_id: params[:group_id])
        group_user.save
        redirect_to request.referer
    end
    
    def destroy
        # 自分のIDを持ったgroup_userの中からさらに、group_idカラムのデータがグループ詳細ページと一緒のデータを探す。
        group_user = current_user.group_users.find_by(group_id: params[:group_id])
        group_user.destroy
        redirect_to request.referer
    end
end
