class Personne < ApplicationRecord

  validates :prenom, presence: true
  validates :nom, presence: true

end
