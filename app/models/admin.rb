class Admin < User
  validates :type, presence: "Admin"
end
