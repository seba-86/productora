class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy 
    has_many :crews, dependent: :destroy 
    validates :status, presence: true
    validates_uniqueness_of :name
    enum status: [:hombre, :mujer, :band]
    accepts_nested_attributes_for :crews, allow_destroy: true

    def concert_count 
        concerts.count
    end

    def people_count
        concerts.pluck(:asistentes)
    end

    def people_max
        concerts.pluck(:asistentes).max
    end

    def end_concert
        concerts.pluck(:date_concert).min.strftime("%Y-%b%d-%a")
    end
    
    
    
    def duration 
        concerts.pluck(:duration).max
    end

    def concert_month
        date1 = Date.parse('2020-12-01')
        date2 = Date.parse('2020-12-31')
        concerts.where("date_concert between ? and ?", date1, date2).count
    end

    def members_name
        crews.pluck(:integrantes)
    end

end
