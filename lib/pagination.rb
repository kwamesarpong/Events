class Pagination
    
    attr_reader :number_of_records_per_page, :number_of_records

    def initialize (number_of_records_per_page = 12, number_of_records)
        @number_of_records_per_page, @number_of_records = number_of_records_per_page, number_of_records
    end

    def total_page_count
        (@number_of_records.to_f / @number_of_records_per_page.to_f).ceil
    end

    def offset (page)
        ( page - 1 ) * @number_of_records_per_page
    end

    def get_number_of_records_per_page
        @number_of_records_per_page
    end

    def get_number_of_records
        @number_of_records
    end

end