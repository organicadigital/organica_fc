class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :score
  has_many :home_games, class_name: "Game", foreign_key: :home_player_id
  has_many :away_games, class_name: "Game", foreign_key: :away_player_id

  after_create :create_score
  before_save :generate_email_md5

  scope :with_games, lambda { includes(home_games: :away_player,
                                       away_games: :home_player) }

  def acronym
    @acronym ||= (name.blank? ? email : name)[0..2].upcase
  end

  def to_s
    @to_s ||= [email, name].reject(&:blank?).join(" - ")
  end

  private
    def create_score
      build_score.save!
    end

    def generate_email_md5
      self.email_md5 = Digest::MD5.hexdigest self.email
    end
end
