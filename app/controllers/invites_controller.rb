class InvitesController < ApplicationController
#before_filter :access_for_admin, :except => [:new, :create]

  # GET /invites
  def index
    @invites = Invite.all
  end

  # GET /invites/1
  def show
    @invite = Invite.find(params[:id])
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  def create
    @invite = Invite.new(params[:invite])
    if @invite.save
      redirect_to(@invites, :notice => 'Invite was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /invites/1
  def update
    @invite = Invite.find(params[:id])
    if @invite.update_attributes(params[:invite])
      redirect_to(@invite, :notice => 'Invite was successfully updated.')
    else
      render :action => "edit"
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
