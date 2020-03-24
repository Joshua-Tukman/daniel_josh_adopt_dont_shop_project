class Pet < ApplicationRecord
    validates_presence_of :name, :image, :age, :sex
    validates :status, inclusion: [true, false]
    belongs_to :shelter

    def adoptable?
        status ? "Ready for Adoption!" : "Pending Adoption"
    end
end