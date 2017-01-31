class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :deny_access, only: [:new, :create, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @message = Message.new
    @messages = Message.between(current_user.id, @user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user_params[:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if user_params[:admin].present? && !current_user.admin?
      params[:user].delete(:admin)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  protected

    def needs_password?(user, params)
      params[:password].present?
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def deny_access
      unless current_user.admin? || current_user == @user
        flash[:alert] = 'You are not allowed to perform this action'
        redirect_to '/admin/users'
      end
    end
end
