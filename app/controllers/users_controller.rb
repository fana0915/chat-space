class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end



  # サーバーはJSON形式で値を返し、jbuilderファイルが読み込まれるようになる
  # app/views/usersディレクトリにindex.json.jbuilderファイルを作成
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
