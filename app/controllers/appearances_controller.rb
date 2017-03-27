class AppearancesController < SessionsController
  before_action :login

  def new
    @appearance = Appearance.new
    @current_user = session[:user_id]
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
    @current_user = session[:user_id]
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to guest_path(@appearance.guest_id)
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:user_id, :guest_id, :episode_id, :rating)
  end

end
