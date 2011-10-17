class InvitesController < ApplicationController
#before_filter :access_for_admin, :except => [:new, :create]

  # GET /invites
  def index
    @invites = Invite.all
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # POST /invites
  def create
    @invite = Invite.new(params[:invite])
    if @invite.save
      redirect_to(invites_path, :notice => 'Invite was successfully created.')
    else
      render :action => "new"
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.xml
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to(invites_url)
  end
  
  def send_invitation
    @invite = Invite.find(params[:id])
    @invite.invite!
    mail = InvitationMailer.invite(@invite)
    mail.deliver
    redirect_to(invites_url, :notice => "Invite sent to #{@invite.email}")
  end
end
