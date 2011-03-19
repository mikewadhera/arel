module Arel
  module Sql
    class Engine
            
      def adapter
        'actslikesql'
      end
      
      def primary_key(table)
        'id'
      end
      
      def table_exists?(name)
        true
      end
      
      def quote_table_name name
        name.to_s
      end

      def quote_column_name name
        "\'#{name.to_s}\'"
      end

      def quote value, name
        case value
        when true
          "'t'"
        when false
          "'f'"
        when nil
          'NULL'
        when Numeric
          value
        else
          "'#{value.to_s.gsub(/\\/, '\&\&').gsub(/'/, "''")}'"
        end
      end
      
    end
  end
end
