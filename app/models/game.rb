class Game < ActiveRecord::Base
  validates :name, presence: :true, length: { minimum: 1 }
  attr_accessor :black_user_email

  has_many :pieces
  
  delegate :pawns, :rooks, :knights, :bishops, :kings, :queens, to: :pieces
 
  belongs_to :white_user, class_name: 'User'
  belongs_to :black_user, class_name: 'User'
  belongs_to :next_user,  class_name: 'User'

  after_create  :populate_board

  # include board.rb
  include Board

  def populate_board
    self.board
    @board[7][0] = Rook.create(y_position: 7, x_position: 0, type: 'Rook', color: 'black', image_name: 'pieces/br.png', game_id: self.id)
    @board[7][1] = Knight.create(y_position: 7, x_position: 1, type: 'Knight', color: 'black', image_name: 'pieces/bn.png', game_id: self.id)
    @board[7][2] = Bishop.create(y_position: 7, x_position: 2, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png', game_id: self.id)
    @board[7][3] = King.create(y_position: 7, x_position: 3, type: 'King', color: 'black', image_name: 'pieces/bk.png', game_id: self.id)
    @board[7][4] = Queen.create(y_position: 7, x_position: 4, type: 'Queen', color: 'black', image_name: 'pieces/bq.png', game_id: self.id)
    @board[7][5] = Bishop.create(y_position: 7, x_position: 5, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png', game_id: self.id)
    @board[7][6] = Knight.create(y_position: 7, x_position: 1, type: 'Knight', color: 'black', image_name: 'pieces/bn.png', game_id: self.id)
    @board[7][7] = Rook.create(y_position: 7, x_position: 0, type: 'Rook', color: 'black', image_name: 'pieces/br.png', game_id: self.id)

    @board[6][0] = Pawn.create(y_position: 6, x_position: 0, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][1] = Pawn.create(y_position: 6, x_position: 1, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][2] = Pawn.create(y_position: 6, x_position: 2, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][3] = Pawn.create(y_position: 6, x_position: 3, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][4] = Pawn.create(y_position: 6, x_position: 4, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][5] = Pawn.create(y_position: 6, x_position: 5, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][6] = Pawn.create(y_position: 6, x_position: 6, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[6][7] = Pawn.create(y_position: 6, x_position: 7, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)

    @board[1][0] = Pawn.create(y_position: 1, x_position: 0, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][1] = Pawn.create(y_position: 1, x_position: 1, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][2] = Pawn.create(y_position: 1, x_position: 2, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][3] = Pawn.create(y_position: 1, x_position: 3, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][4] = Pawn.create(y_position: 1, x_position: 4, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][5] = Pawn.create(y_position: 1, x_position: 5, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][6] = Pawn.create(y_position: 1, x_position: 6, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)
    @board[1][7] = Pawn.create(y_position: 1, x_position: 7, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', game_id: self.id)

    @board[0][0] = Rook.create(y_position: 0, x_position: 0, type: 'Rook', color: 'black', image_name: 'pieces/br.png', game_id: self.id)
    @board[0][1] = Knight.create(y_position: 0, x_position: 1, type: 'Knight', color: 'black', image_name: 'pieces/bn.png', game_id: self.id)
    @board[0][2] = Bishop.create(y_position: 0, x_position: 2, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png', game_id: self.id)
    @board[0][3] = King.create(y_position: 0, x_position: 3, type: 'King', color: 'black', image_name: 'pieces/bk.png', game_id: self.id)
    @board[0][4] = Queen.create(y_position: 0, x_position: 4, type: 'Queen', color: 'black', image_name: 'pieces/bq.png', game_id: self.id)
    @board[0][5] = Bishop.create(y_position: 0, x_position: 5, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png', game_id: self.id)
    @board[0][6] = Knight.create(y_position: 0, x_position: 1, type: 'Knight', color: 'black', image_name: 'pieces/bn.png', game_id: self.id)
    @board[0][7] = Rook.create(y_position: 0, x_position: 0, type: 'Rook', color: 'black', image_name: 'pieces/br.png', game_id: self.id)

    @board
  end

  # scope that returns all games where user is white or black 
  def self.user_games(user)
    where('white_user_id = ? OR black_user_id = ?', user.id, user.id)
  end  
  
  def end_turn
    if self.next_user == self.white_user
      self.next_user = self.black_user
    else
      self.next_user = self.white_user # sets white user first
    end
  end

  private

  def must_have_both_user
    return unless self.black_user.nil? && self.white_user.nil?
    self.errors.add(:base, 'must have two')
    return unless self.white_user.nil?
    self.errors.add(:white_user, 'must include the white user')
    return unless self.black_user.nil?
    self.errors.add(:black_user, 'must include the black user')
  end

  def must_have_distinct_users
    return unless self.white_user == self.black_user
    self.errors.add(:white_user, 'must be distinct from black_user')
  end
end

