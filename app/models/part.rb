class Part < ApplicationRecord
  belongs_to :subject
  has_many :questions

  enum status: { unfinish: 0, finish: 1 }
  validates :title, :content, :status, presence: true
  validates :status, inclusion: { in: Part.statuses.keys }

  def toggle_status!
    if unfinish?
      finish!
    else
      unfinish!
    end
  end
end
