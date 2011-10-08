class PostsController < ApplicationController
  respond_to :js



  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all(:conditions => ["weight > ?",0],:order =>"weight DESC, created_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js   # index.js.erb
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new

    if session[:user_id].blank?
       redirect_to :action => 'login',:controller => "users"
    end

    @post = Post.new
    @user = User.find(session[:user_id])
    @user.post_count+=1
    @user.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        if @post.reply_id != nil
          format.html { redirect_to action: "display_all_replies", :id => @post.reply_id}
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { redirect_to action: "index" }
          format.json { render json: @post, status: :created, location: @post }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        if @post.reply_id == nil
          format.html { redirect_to posts_url }
          format.json { head :ok }
        else
          format.html { redirect_to :action => "display_all_replies",:id=>@post.reply_id}
          format.json { head :ok }
        end

      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def increment_vote
    @post = Post.find(params[:id])
    @post.votes_count+=1
    @post.weight+= 1440
    @post.save

    @vote = Vote.new
    @vote.user_id = session[:user_id]
    @vote.post_id = @post.id
    @vote.save

    respond_to do |format|
      if @post.reply_id == nil
        format.html { redirect_to :action => "index"}
      #format.js {render :layout => false}
      else
        format.html { redirect_to :action => "display_all_replies",:id=>@post.reply_id}

      end
    end
  end

  def search
    if params[:search]
       @posts=Post.find(:all,:conditions => ['reply_id=? and post_desc LIKE? or post_title LIKE?',nil,"%#{params[:search]}%", "%#{params[:search]}%"],:order =>"weight DESC")
       @users=User.find(:all,:conditions =>['first_name LIKE? or last_name LIKE?', "%#{params[:search]}%", "%#{params[:search]}%"])
       @users.each do |u|
         @posts+=Post.find_all_by_creator_id(u.id)
       end
    end
    return @posts
    render :action=>'search'
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def delete
    @post = Post.find(params[:id])
    @replies = Post.find_all_by_reply_id(params[:id])

    if !@replies.nil?
      @replies.each do |u|
        u.destroy
      end
    end

    respond_to do |format|
      if @post.destroy
             format.html { redirect_to :controller => "users",:action => "show_all_posts" }
             format.json { head :ok }

      else
          format.html {"Sorry post not deleted"}
      end

    end
  end
=begin
   def reply_increment_vote
    @post = Post.find(params[:id])
    @post.votes_count+=1
    @post.save

    @vote = Vote.new
    @vote.user_id = session[:user_id]
    @vote.post_id = @post.id
    @vote.save

   respond_to do |format|
      format.html { redirect_to :action =>"display_all_replies",:id=>@post.reply_id, :remote=>true}
      #format.js {render :layout => false}
    end
  end
=end


  def reply
       @post = Post.new
      @post.reply_id=params[:id]
      @post_parent=Post.find(params[:id])

    respond_to do |format|
      format.html # show_all_recipes.erb
      format.json { render json: @post ,:request => @post_parent }
    end
  end
=begin
  def create_reply
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to action: "display_all_replies" }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  def display_all_replies
  @posts=Post.find_all_by_reply_id(params[:id])
  @post_head=Post.find(params[:id])
    respond_to do |format|
      format.html # display_all_recipies.erb
      format.json { render json: @posts,:request => @post_head}
    end
  end

 # def show_post_info
   #@post=Post.find(params[:id])
  #end

  def search
    if params[:search]
       @posts=Post.find(:all,:conditions => ['post_desc LIKE? or post_title LIKE?', "%#{params[:search]}%", "%#{params[:search]}%"],:order =>"votes_count DESC")
       @users=User.find(:all,:conditions =>['first_name LIKE? or last_name LIKE?', "%#{params[:search]}%", "%#{params[:search]}%"])
       @users.each do |u|
         @posts+=Post.find_all_by_creator_id(u.id)
       end
    end
    return @posts
    render :action=>'search'
  end
end
