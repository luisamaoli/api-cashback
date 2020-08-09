module CustomerService
    class DataAccess
      attr_reader :customer
  
      def self.find_through_id(id)
        @customer = Customer.find(id)
      end

      def self.list_from_company(company)
        company.customer
      end   
    end
end