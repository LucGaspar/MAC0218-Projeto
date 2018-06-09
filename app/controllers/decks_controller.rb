class DecksController < ApplicationController
    before_action :authenticate_user!
    def new
        @deck=Deck.new
    end
    def edit
        @deck = current_user.decks.find(params[:id])
    end
    def create
        @deck = current_user.decks.create(deck_params)
        if @deck.save
            redirect_to @deck 
        else
            render 'new' 
        end
    end

    def update 
        @deck = current_user.decks.find(params[:id])
        if @deck.update(deck_params)
            redirect_to @deck
        else
            render 'edit'
        end
    end

    def destroy
        @deck = Deck.find(params[:id])
        @deck.destroy
        redirect_to decks_path
    end

    def show
        @deck = Deck.find(params[:id])
    end
    
    def index
        @deck = current_user.decks.all  
    end

    def start
        @deck= Deck.find(params[:deck_id])
        @card = @deck.random_card
    end

    private
    def deck_params
        params.require(:deck).permit(:name,:description, :shareable)
    end

end
