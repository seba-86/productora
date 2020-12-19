class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy 
    enum status: [:hombre, :mujer, :banda]

    def concert_count 
        concerts.count
    end

    def people_count
        concerts.pluck(:asistentes)
    end

    def people_max
        concerts.pluck(:asistentes).max
    end
end
