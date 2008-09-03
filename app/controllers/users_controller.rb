class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystems
  skip_before_filter :check_permissions
  
  # render index.html.erb
  def index
    @users = User.find(:all)
  end

  def galleries
    @user = User.find(params[:id])
    @galleries = @user.galleries
	render :action=>'../galleries/index'
  end
  
  def profile
    @user = User.find(params[:id])
    @profile = @user.profile
	render :action=>'../profiles/show'
  end
  
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
	p = Profile.new(:title => 'Album', :observer_may_comment => false)
	p.save!
	@user.profile_id = p.id
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  
  # admin section
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(users_url)
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
	@user.profile.destroy
    @user.destroy

    redirect_to(users_url)
  end
end
