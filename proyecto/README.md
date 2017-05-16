# README

* Ruby version: 5.0.2

* Rails commands called

        rails generate scaffold Person first_name:string last_name:string email:string
        rails generate scaffold Course title:string code:string person:references
        rails generate scaffold Enrollment person:references course:references
        rails db:migrate

        // Use teacher instead of person in Course controllers
        rails generate scaffold_controller Course title code teacher --force

        // Use student instead of person in Enrollment controllers
        rails generate scaffold_controller Enrollment student course --force

        // add quota to courses
        rails generate migration AddQuotaToCourses

        // add quota to courses
        rails generate migration AddIsProfessorToPeople

        // add Assignment model
        rails generate scaffold Assignment title:string statement:text course:references

        // add Grade model
        rails generate scaffold Grade value:float person:references assignment:references
