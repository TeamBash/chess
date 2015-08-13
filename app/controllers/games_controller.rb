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
    # @games = Game.where(black_user_id: nil)

  end

  def new
    @game = Game.new
  end
  
  def join
    @game = Game.find(params[:game_id])
    if @game.white_user != current_user
      @game.black_user = current_user
      flash.alert = 'Black player joined!'
      @game.save
      redirect_to game_path(@game)
    else
      flash.alert = 'Failed to add opponent!'
      redirect_to game_path(@game)
    end
  end

  def create
    @game = Game.new(game_params)
    @game.white_user = current_user

    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    @board = @game.get_board
    if @board.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def select
    @game = Game.find(params[:game_id])
    @board = @game.get_board
    @piece = Piece.find(params[:id])
  end

  def piece_update
    @game = Game.find(params[:game_id])
    @piece = Piece.find(params[:id])
    @piece.update_attributes(:x_position => params[:x_position], :y_position => params[:y_position])
    redirect_to game_path(@game)
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
    params.require(:game).permit(:name)
  end
end