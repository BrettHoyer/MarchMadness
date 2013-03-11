class PicksController < ApplicationController
  # GET /picks
  # GET /picks.json
  before_filter :require_admin, :only => [:edit]

  def index
    if User.where(:id=>session[:user_id])
      @picks=Pick.all
    else
      @picks = Pick.where(:user_id => session[:user_id])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picks }
    end
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
    @pick = Pick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/new
  # GET /picks/new.json
  def new
    @pick = Pick.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/1/edit
  def edit
    @pick = Pick.find(params[:id])
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = Pick.new(params[:pick])
    respond_to do |format|
      if @pick.save
         @user = User.find_by_id(session[:user_id])
        format.js{ render 'create', :user => @user }
        format.html { redirect_to odds_url, notice: 'Pick was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picks/1
  # PUT /picks/1.json
  def update
    @pick = Pick.find(params[:id])

    respond_to do |format|
      if @pick.update_attributes(params[:pick])
        format.html { redirect_to @pick, notice: 'Pick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end
end
