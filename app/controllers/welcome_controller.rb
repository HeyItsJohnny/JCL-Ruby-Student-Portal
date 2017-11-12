class WelcomeController < ApplicationController

    def index

    end
    
    def new
    
    end
    
    def create
        account = Account.find_by(email: params[:welcome][:email].downcase)
        if account && account.authenticate(params[:welcome][:password])
            log_in account
            redirect_to '/home'
        else
            flash[:danger] = 'Invalid email/password combination' 
            redirect_to root_url
        end

    end

    def destroy
        log_out
        redirect_to root_url
    end

    private

    def account_params
        params.require(:account).permit(:email, :password)
    end
end
