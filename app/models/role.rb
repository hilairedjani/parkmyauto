class Role < ApplicationRecord
    belongs_to :user
    enum role_name: [ :user, :admin ]
end
