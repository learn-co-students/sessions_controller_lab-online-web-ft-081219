class SessionsController < ApplicationController
    def create 
        if !login_params.has_key?(:name)
            redirect_to "/login"
        else 
            if login_params[:name].empty?
                redirect_to "/login"
            else
                session[:name] = login_params[:name]
                redirect_to "/"
            end
        end
    end 

    def destroy 
        session[:name] ? session.clear : nil
    end

    private 
    def login_params 
        params.permit(:name)
    end
end