class Game < ActiveRecord::Base
  validates :name, presence: :true, length: { minimum: 1 }
  after_create  :create_pieces

  has_many :pieces
  delegate :pawns, :rooks, :knights, :bishops, :kings, :queens, to: :pieces
 
  belongs_to :white_user, class_name: 'User'
  belongs_to :black_user, class_name: 'User'
  belongs_to :next_user,  class_name: 'User'
  
  # scope that returns all games where user is white or black 
  def self.user_games(user)
    where('white_user_id = ? OR black_user_id = ?', user.id, user.id)
  end  
    
  def get_board
    @board ||= Array.new(8) { Array.new(8) }
    self.pieces.each do |piece|
      x = piece.x_position
      y = piece.y_position
      @board[y][x] = piece 
    end
    return @board
  end

  private
  
  INITIAL_PIECE_LOCATIONS = [
     #<-------------------------------Black Pieces--------------------------------------------------------->
    {y_position: 0, x_position: 0, type: 'Rook',   color: 'black', image_name: 'pieces/br.png'},
    {y_position: 0, x_position: 1, type: 'Knight', color: 'black', image_name: 'pieces/bn.png'},
    {y_position: 0, x_position: 2, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png'},
    {y_position: 0, x_position: 3, type: 'Queen',  color: 'black', image_name: 'pieces/bq.png'},
    {y_position: 0, x_position: 4, type: 'King',   color: 'black', image_name: 'pieces/bk.png'},
    {y_position: 0, x_position: 5, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png'},
    {y_position: 0, x_position: 6, type: 'Knight', color: 'black', image_name: 'pieces/bn.png'},
    {y_position: 0, x_position: 7, type: 'Rook',   color: 'black', image_name: 'pieces/br.png'},

    {y_position: 1, x_position: 0, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 1, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 2, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 3, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 4, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 5, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 6, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    {y_position: 1, x_position: 7, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png'},
    #<-------------------------------White Pieces--------------------------------------------------------->
    {y_position: 6, x_position: 0, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 1, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 2, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 3, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 4, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 5, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 6, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},
    {y_position: 6, x_position: 7, type: 'Pawn', :color => 'white', image_name: 'pieces/wp.png'},

    {y_position: 7, :x_position => 0, type: 'Rook',   :color => 'white', image_name: 'pieces/wr.png'},
    {y_position: 7, :x_position => 1, type: 'Knight', :color => 'white', image_name: 'pieces/wn.png'},
    {y_position: 7, :x_position => 2, type: 'Bishop', :color => 'white', image_name: 'pieces/wb.png'},
    {y_position: 7, :x_position => 3, type: 'Queen',  :color => 'white', image_name: 'pieces/wq.png'},
    {y_position: 7, :x_position => 4, type: 'King',   :color => 'white', image_name: 'pieces/wk.png'},
    {y_position: 7, :x_position => 5, type: 'Bishop', :color => 'white', image_name: 'pieces/wb.png'},
    {y_position: 7, :x_position => 6, type: 'Knight', :color => 'white', image_name: 'pieces/wn.png'},
    {y_position: 7, :x_position => 7, type: 'Rook',   :color => 'white', image_name: 'pieces/wr.png'},
  ]

  def create_pieces
    INITIAL_PIECE_LOCATIONS.each do |piece|
      self.pieces.create(piece)
    end
  end
  
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

  def end_turn
    if self.next_user == self.white_user
      self.next_user = self.black_user
    else
      self.next_user = self.white_user # sets white user first
    end
  end
end
