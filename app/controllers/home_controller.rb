class HomeController < ApplicationController
  def index
  end
    
    def about
        
    end

  def index
        
        @username = ""
        
        unless session["user_id"].nil?
            @username =User.find(session["user_id"]).username
        end
    end
    
    def login
    end
    
    def login_process
        u = User.where(:username => params[:username],
                       :password => params[:password]).take
        unless u.nil?
            session["user_id"] = u.id
        end
        
        redirect_to "/home/index"
    end
    
    def logout
        reset_session
        redirect_to '/home/index'
    end
    
    def join
    end
    
    def join_process
       u = User.new
       u.username = params[:username]
       u.password = params[:password]
       u.save
       
       redirect_to '/home/index'
    end
    
    def upload
    end
    
    def post_write
        uploader = AvatarUploader.new
        uploader.store!(params[:pic])
        post = Post.new(title: params[:title], content: params[:content], image_url: uploader.url)
        
        if post.save
          redirect_to "/about"
        end
    end
    

    def view
        @post = Post.find(params[:id])
    end
    
    
    def recommend
        post = Post.find(params[:id])
        post.upcount += 1
        
        if post.save
          redirect_to "/view/?id=#{params[:id]}"
        end
    end
end
