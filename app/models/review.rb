class Review < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :user
  belongs_to :movie

  # validates :user_id, uniqueness: { scope: :movie_id, message: "can only review a movie once" }

  def destroy
    update(deleted_at: Time.now)
  end
end
