class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model
  multisearchable against: [:title, :syllabus]
  pg_search_scope :global_search,
                  against: [
                    [:title, 'A'],
                    [:syllabus, 'B']
                  ],
                  associated_against: {
                    director: [:first_name, :last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_by_title_and_syllabus,
                  against: [
                    [:title, 'A'],
                    [:syllabus, 'B']
                  ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
