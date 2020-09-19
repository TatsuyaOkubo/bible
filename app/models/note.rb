class Note < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      Note.where('text LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end
end
