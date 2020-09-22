class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :text

  def self.search(search)
    if search != ""
      Note.where('text LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end
  scope :search, -> (search_param = nil){
    return if search_param.blank?
    joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = notes.id AND action_text_rich_texts.record_type = 'Note'")
    .where("action_text_rich_texts.body LIKE ? ", "%#{search_param}%")
}
end
