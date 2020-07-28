class Admin::TweetsController < ApiController
  before_action :authenticate_user

  def index
    user = @current_user.id
    following = Following.where(user_id: user).pluck(:following_id)
    @tweets =  Tweet.where(user_id: following)
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = @current_user.id
    if @tweet.save
      set_flash_notification :success, :create, entity: 'Tweet'
      redirect_to admin_users_path
    else
      set_instant_flash_notification :danger, :default, {:message => @tweet.errors.messages[:base][0]}
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:description)
  end


  def checks_for_logged_in_user
    unless user_signed_in?
      protocol = Rails.application.routes.default_url_options[:protocol] || "http"
      redirect_to new_user_session_url(protocol: protocol)
    end
  end
end
