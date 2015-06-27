# Each game requires two signed-in human players (i.e. no AI)
# Coin flip decides which player is white (and thus plays first)
# Full implementation of rules, including castling, etc.
# Each player move is validated
# (eg: making sure pieces are not moved off the board)
# Game ends upon checkmate, stalemate or player resignation

class GamesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def invite()
  end

  def create
    @game = Game.new(game_params)
    @game.white_user = current_user
    black_user = User.find_by(email: @game.black_user_email)
    @game.black_user = black_user

    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy
    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    @game.update_attributes(game_params)
    if @game.valid?
      redirect_to games_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:name,:black_user_email)
  end
end
