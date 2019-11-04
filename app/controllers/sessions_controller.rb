class SessionsController < ApplicationController
    def new
        if session[:name]
            redirect_to '/'
        end
    end
    
    def create
        if params[:name].nil?||params[:name].empty?
            redirect_to '/login', alert:"Invalid name!"
        else
            session[:name] = params[:name]
            redirect_to controller:'application', action:'hello'
        end
    end
    
    def destroy
        session.delete :name
        redirect_to '/'
    end
end