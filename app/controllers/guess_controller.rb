class GuessController < ApplicationController
  before_action :authenticate_user!

  def create
    @guess = Guess.new(user_id: current_user.id, card_id: params[:card_id],
                       duration: params[:duration],
                       correct: params[:correct] == "true" ? true : false)

    if @guess.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @guess = Guess.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end
end

Deck.find

Guess.find_by(deck_id: params[:deck_id], )


