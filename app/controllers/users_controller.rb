class UsersController < ApplicationController

  def new
    @user=User.new
  end


  def create
    @user=User.new(params[:user])
    session[:error]=nil

    respond_to do |format|
      #puts "creating #{@user.inspect}"
      if @user.save
        if session[:admin]=="true"
          format.html {redirect_to :controller => 'users', :action=>'list'}
        else

          format.html {redirect_to :controller => 'users', :action=>'login'}
        end
      else
        format.html { render :action => 'new'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def login
    @user=User.new(params[:user])
    @current_user=User.find_by_user_name(@user.user_name)

    if @current_user.blank?
      render :action=>'login'
    else
      if @current_user.password.to_s.eql? @user.password.to_s
        session[:user_id]=@current_user.id
        session[:admin]=@current_user.admin

        if @current_user.admin.to_s.eql? "false"
          redirect_to :controller => 'posts', :action => 'index'
        else
          if @current_user.admin.to_s.eql? "true"
            redirect_to :action=>'list'
          end

        end
      else
        render :action =>'login'
        session[:error]="Username or Password is incorrect"
      end
    end
  end

  def logout
    session[:user_id]=nil
    session[:admin]=nil
    redirect_to :controller=>'users',:action=>'login'
  end


  def edit
    if session[:user_id].nil?
      render :action => 'login'
    else
      @user=User.find(session[:user_id])
    end
  end


  def update
    @user=User.find(session[:user_id])
    #@user=User.new(session)
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to :controller => 'posts', :action=>'index'}
      else
        format.html { render :action => 'edit', :id => @user.id}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def list
    @users=User.find(:all)
    @posts=Post.find(:all)
  end

  def show_post_info
    @post=Post.find(params[:id])
    @user=User.find(@post.creator_id)


  end

  def show_user_info
    @user = User.find(params[:id])
    @posts=Post.find_all_by_creator_id(@user.id)
  end

  def show_all_posts
    @posts=Post.find(:all)

  end

  def show_all_users
    @users=User.find(:all)
  end

  def manage_users
    @users=User.find(:all)
  end

  def delete_user
    @user=User.find_by_user_name(params[:id])
    @user.destroy
    redirect_to :action=>'manage_users'
  end

  def view_post_activity
    @posts=Post.all(:order => "creator_id")
  end

end
