class Chilli < ApplicationRecord
  belongs_to :user
  has_many :sale_chillis
  has_many :flags
  has_many_attached :photos

  include AlgoliaSearch

  algoliasearch do
    # all attributes will be sent
    attributes :variety, :chilli_type, :species, :description, :heat

    searchableAttributes ['variety', 'chilli_type', 'species', 'heat', 'unordered(description)']
  end
end
