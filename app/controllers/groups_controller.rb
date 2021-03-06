class GroupsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :edit, :create, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
	def index
		@groups = Group.all
	end
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(group_params)
    @group.user = current_user
		if @group.save
			redirect_to group_path(@group)
		else
			render :new
		end
	end
	def show
		@group = Group.find(params[:id])
	end
	
	def edit
		#find_group_and_check_permission
	end
	
	def update
		#find_group_and_check_permission
		if @group.update(group_params)
			redirect_to groups_path, notice:"Update Success xxxx"
		else
			render :edit
		end
	end
	def destroy
		#find_group_and_check_permission
		@group.destroy
		flash[:alert]="Group deleted"
		redirect_to groups_path
	end
	private
	
  def find_group_and_check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
  end
  
  def group_params
		params.require(:group).permit(:title, :description)
	end
		
end
