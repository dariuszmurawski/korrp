class Connbuffer< ActiveRecord::Base
  self.abstract_class = true
  

  def self.getdata(sql,poltaxconn)      
    connhandle=establish_connection(adapter: "oracle_enhanced", database: "//"+poltaxconn.database+":1521/PLTX",username: poltaxconn.username, password: poltaxconn.password)       
    result = connhandle.connection.select_all(sql).to_ary() 
    return result
    rescue => e
      result =nil
      return result
  end

  
end