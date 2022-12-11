class PasswordManager2
    def initialize
        @passwords = {}
        require 'date'
    end

    def add(service,password)
        date = DateTime.now.strftime("%d/%m/%Y")

        if @passwords.has_key?(service)
            return "ERROR: Service names must be unique"
        end
        @passwords.keys.each do |x| 
            if @passwords[x]['password'] == password 
                return "ERROR: Passwords must be unique"
            end
        end
        @passwords[service] = { 'password' => password, 'added_on' => Date.strptime(date, "%d/%m/%Y") }
    end

    def remove(service)
        @passwords.delete(service)
    end

 
    def services
        @passwords.keys
    end


    def sort_by(arg)
        if arg == "service"
            @passwords.keys.sort
        elsif arg == "added_on"
            @passwords.keys.sort_by{|k,v| @passwords[k]['added_on']}
        end
    end


    def password_for(service)
        return @passwords[service]['password']
    end

    def update(service,newpassword)
        date = DateTime.now.strftime("%d/%m/%Y")
        @passwords.keys.each do |x| 
            if @passwords[x]['password'] == newpassword 
                return @passwords[service]['password']
            end
        end
        @passwords[service] = { 'password' => newpassword, 'added_on' => Date.strptime(date, "%d/%m/%Y") }
    end
end
