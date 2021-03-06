class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /users
  # GET /users.json
  def index
      render :json => User.all
  end

  def search_users
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
      render :json => @users
  end




  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
       flash[:success] = "Profile Updated!"  
       redirect_to :back
      else
       flash[:error] = "Something Went Wrong"
       redirect_to :back
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      user_params = params.require(:user).permit(:age, :gender, :first_name,
                                :last_name, :school, :facebook, :linkedin,
                                :twitter, :github, :resume, :website, :authenticity_token,
                                :id, :created_at, :updated_at, :email, [:resumes_attributes => ['title', 'user_id', 'file', '_destroy']],
                                :user_id, :status, :team_id)
    end
end
