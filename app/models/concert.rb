class Concert < ApplicationRecord
    belongs_to :group
    
    validate :error_date

    def error_date 
        if date_concert < Date.today
            errors.add(:date_concert, "no se puede crear un concierto en pasado")
        end
    end
end
