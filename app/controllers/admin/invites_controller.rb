# encoding: utf-8
class Admin::InvitesController < ApplicationController
#before_filter :access_for_admin, :except => [:new, :create]

  def index
    @invites = Invite.not_redeemed
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(params[:invite])
    if @invite.save
      redirect_to(admin_invites_path, :notice => 'Приглашение создано и отправлено.') 
    else
      render :new
    end
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to(admin_invites_url)
  end

end
