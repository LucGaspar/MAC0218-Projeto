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
        if (params[:card_id] == nil)
            params[:card_id] = 0
        end

        @deck = Deck.find(params[:deck_id])

        if (params[:grade] != nil)
            card = @deck.cards.find_by_id(params[:card_id])
            q = params[:grade].to_i
            
            if (params[:grade].to_i == 0)
                n_days = 0
                ef = card[:e_factor]
            else
                n_days = card[:n_days] + 1
                ef = card[:e_factor] + (0.1 - (3 - q) * (0.08 + (5 - q) * 0.02))
            end
            Card.where("deck_id = #{params[:deck_id]} AND id = #{params[:card_id]}").update_all("e_factor = #{ef}, played_at = '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}', n_days = #{n_days}")
        end

        @card = @deck.ozniak()
    end

    private
    def deck_params
        params.require(:deck).permit(:name, :description, :shareable)
    end

end
