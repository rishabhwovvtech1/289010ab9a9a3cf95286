class Admin::UsersController < ApiController
  before_action :authenticate_user

  def index
    @tweets = @current_user.tweets
  end

  def new
    @user = User.new
  end

  def dashboard
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @follows = false
    id = @user.id
    @same = false
    if id == @current_user.id
      @same = true
    end
    ids = Following.where(user_id: @current_user.id).pluck(:following_id)
    if ids.include?(id)
      @follows = true
    end
    @tweets = @user.tweets
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_flash_notification :success, :create, entity: 'User'
      redirect_to admin_users_path
    else
      set_instant_flash_notification :danger, :default, {:message => @user.errors.messages[:base][0]}
      render :new
    end
  end

  def follow
    @follow = Following.new(user_id: @current_user.id, following_id: params[:follow_id])
    if @follow.save
      redirect_to admin_tweets_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.attributes = user_params
    if @user.important_changed?
    end
    if @user.save
      set_flash_notification :success, :update, entity: 'User'
      redirect_to admin_users_path
    else
      set_instant_flash_notification :danger, :default, {:message => @user.errors.messages[:base][0]}
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :phone_number, :password)
  end


  def checks_for_logged_in_user
    unless user_signed_in?
      protocol = Rails.application.routes.default_url_options[:protocol] || "http"
      redirect_to new_user_session_url(protocol: protocol)
    end
  end
end
