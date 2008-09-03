class ProfilesController < ApplicationController
  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        #format.html { redirect_to(@profile) }
		format.html { redirect_to :action => 'profile', :controller => 'users', :id => current_user }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

end
