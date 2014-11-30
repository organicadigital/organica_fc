class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :scores

  before_save :generate_email_md5

  scope :sorted, -> { order(:email) }

  def acronym
    @acronym ||= email[0..2].upcase
  end

  def to_s
    @to_s ||= email
  end

  private
    def generate_email_md5
      self.email_md5 = Digest::MD5.hexdigest self.email
    end
end
