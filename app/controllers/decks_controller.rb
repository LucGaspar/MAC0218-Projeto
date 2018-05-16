class DecksController < ApplicationController
    before_action :authenticate_user!
    def new

    end

    def create
       # render plain: params[:deck].inspect 
       # render plain: current_user.inspect
        #@deck = Deck.new(params[:deck])
        #@deck = Deck.new({"name"=>"ssss", "description"=>"ssss"})
        #@deck =  Deck.new(deck_params)
        @deck = current_user.decks.create(deck_params)
        if @deck.save
            redirect_to @deck 
        else
            render plain: @deck.inspect
        end
    end

    def edit

    end
    def show
        @deck = Deck.find(params[:id])
    end
    
    def index
        @deck = current_user.decks.all  
    end

    private
    def deck_params
        params.require(:deck).permit(:name,:description)
    end
end
