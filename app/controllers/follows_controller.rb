class FollowsController < ApplicationController
    # def create
    #   @followed = User.find(params[:id])
    #   current_user.follow!(@followed)
    #   # respond_to do |format|
    #   #   format.js { @user = @followed}
    #   # end
    # end
    protect_from_forgery with: :exception
    def create
        #is this bulk addition or individual addition?
        # if params.include?(:followee_id) #individual e.g. "Add friend" link
        #   @new_friendships = Follow.create_reciprocal_for_ids(current_user.id, params[:followee_id])
        # else
        #   params[:user][:followee_ids].each do |f_id|
        #   @new_friendships = Follow.create_reciprocal_for_ids(current_user.id, f_id)
        #   end
        # end
        # redirect_to users_path
        # byebug
        @follow = Follow.new(follow_params)
        @follow.follower_id = current_user.id
        # @followee_id = current_user.followee
        # current_user.followee.each do |obj|
        #   @obj_id = obj.id
        #   if !current_user.followees.include?(@obj)
        #     puts @obj
            if @follow.save
              redirect_to current_user
            # if @follow.save
            #   redirect_to current_user
          else
            render @user
            # end
          end
        # end
        # @follow = Follow.new(follow_params)
        # @follow.follower_id = current_user.id
        # # @followee_id = current_user.followee
        # if !current_user.followees.include?(:followee.id)
        #   if @follow.save
        #     redirect_to current_user
        #   end
        #   # if @follow.save
        #   #   redirect_to current_user
        # else
        #   render @user
        #   # end
        # end
    end

    def destroy
        Follow.destroy_reciprocal_for_ids(current_user.id, params[:followee_id])
        # redirect_to(request.referer)
    end

    private 
    def follow_params
      params.require(:follow).permit(:followee_id)
    end
end