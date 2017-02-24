class EpitaphsController < ApplicationController

  def write
    if epitaph_params[:name].blank?
      redirect_to :root
      return
    end
    session[:name] = epitaph_params[:name]
    redirect_to new_epitaph_path
  end

  def new
    if session[:name].blank?
      redirect_to :root
      return
    end
    @epitaph = Epitaph.new name: session[:name]
  end

  def create
    session[:epitaph] = epitaph_params

    if current_user
      redirect_to epitaphs_path
      return
    end

    # User not logged in, send them off to do so
    store_location_for :user, epitaphs_path

    case params[:commit]
    when t(:twitter_submit) then redirect_to user_twitter_omniauth_authorize_path
    else
      # don't know how they got here. is error or someone messing with the form.
      logger.error "Got a bad value for submit on #{create_epitaph_path}: #{params[:commit].inspect}"
      redirect_to :root
    end
  end

  # user will end up here after clicking "save" and going through login redirect dance
  def index
    if !current_user
      # TODO: this could redirect to a login page instead
      redirect_to :root
      return
    end

    # case we would normally expect
    if session[:epitaph] && session[:epitaph].respond_to?(:[])
      e = session.delete(:epitaph).with_indifferent_access
      @epitaph = Epitaph.find_or_initialize_by(user: current_user)
      @epitaph.name = e[:name]
      @epitaph.text = e[:text]
      @epitaph.save!
    end

    @epitaph ||= current_user.epitaph

    logger.debug "Final epitaph: #{@epitaph.inspect}"
  end


  private

  def epitaph_params
    params.fetch(:epitaph, {}).permit(:name, :text)
  end
end
