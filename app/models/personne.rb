class Personne < ApplicationRecord

  validates :prenom, presence: true
  validates :nom, presence: true

  def self.filter(filter)
    where(
        "nom ILIKE ? OR nom ILIKE ? OR prenom ILIKE ? OR prenom ILIKE ?",
        "#{filter}%", "%#{filter}", "#{filter}%", "%#{filter}"
    )
  end

end
