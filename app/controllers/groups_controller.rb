class GroupsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        @group_user = GroupUser.new(group_user_params)
        @group.owner_id = current_user.id
        if @group.save
            redirect_to groups_path
        else
            render 'new'
        end    
    end
    
    def index
        @book = Book.new
        @groups = Group.all
    end
    
    def edit
        @group = Group.find(params[:id])
    end
    
    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path
        else
            render 'edit'
        end    
    end
    
    def show
        @book = Book.new
        @group = Group.find(params[:id])
    end    
    
    private
    def group_params
        params.require(:group).permit(:name, :introduction, :image)
    end
    
    def group_user__params
        params.require(:group).permit(:user_id, :group_id)
    end  
end
