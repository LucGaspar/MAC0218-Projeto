class CardsController < ApplicationController
    def new
        @deck = Deck.find(params[:deck_id])
        @card = Card.new
    end

    def edit
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.find(params[:id])
    end

    def create
        @deck = Deck.find(params[:deck_id])
        print card_params
        @card = @deck.cards.create(card_params)
        if @deck.save
            redirect_to @deck 
        else
            render 'new' 
        end
    end
    def update
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.find(params[:id])
        if @card.update(card_params)
            redirect_to @deck
        else
            render 'edit'
        end
    end

    def destroy
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.find(params[:id])
        @card.destroy
        redirect_to @deck
    end

    def show
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.find(params[:id])
    end
    def index
        redirect_to deck_path(params[:deck_id])
    end
    private
    def card_params
        params.require(:card).permit(:front, :verse, :time_to_appear)
    end
end
