module CompanyService
    class DataAccess
      attr_reader :company
  
      def self.find_through_id(id)
        @company = Company.find(id)
      end

      def self.list_from_customer(customer)
        customer.company
      end  
    end
end