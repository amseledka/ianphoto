class Admin::InvitesController < ApplicationController
#before_filter :access_for_admin, :except => [:new, :create]
  def index
    @invites = current_user.invites.all
  end

  def new
    @invite = current_user.invites.new
  end

  def create
    @invite = current_user.invites.new(params[:invite])
    if @invite.save
      redirect_to(admin_invites_path, :notice => 'Invite was successfully created.')
    else
      render :new
    end
  end

  def destroy
    @invite = current_user.invites.find(params[:id])
    @invite.destroy
    redirect_to(admin_invites_url)
  end

end
