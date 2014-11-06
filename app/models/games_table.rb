class GamesTable
  attr_reader :players
  def initialize
    @players = Player.all
    @games = Game.all
  end

  def home_games
    @home_games ||= @players.combination(2).to_a
  end

  def away_games
    @away_games ||= @players.reverse.combination(2).to_a
  end

  def all
    @all ||= (home_games + away_games).map do |arr|

      OpenStruct.new home_player: arr[0],
                     away_player: arr[1],
                     result: detect_game(arr[0].id, arr[1].id)
    end
  end

  private
    def detect_game(home_id, away_id)
      @games.detect do |r|
        r.home_player_id == home_id && r.away_player_id == away_id
      end
    end

end