

def mymethod
    puts "top"
    yield
    puts "bottom"
end

mymethod do 
    puts "whatever"
end




myname = "jeff"

myfunction = ->(user){
    puts "here we are #{user.id} #{myname}"
}

myfunction.call
myfunction.call
myfunction.call(user)

user = User.last
user.do_something_with_lambda(myfunction) 

MyModule
    
    CHECK_XYZ = ->{
        # doing check....
    }

end

MyModule::CHECK_XYZ.call



