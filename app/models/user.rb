class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    has_many :vehicles, dependent: :destroy
    has_one :role, dependent: :destroy

    # Validation
    validates :telephone_number, allow_blank: true, numericality: { only_integer: true }, length: { is: 10 }
    validates :postal_code, allow_blank: true, format: { with: /\A[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d\z/i,
        message: "format is invalid" }
end
