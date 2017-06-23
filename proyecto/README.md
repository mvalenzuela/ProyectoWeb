# README

* Ruby version: 5.0.2

* Rails commands called

      rails g devise:install
      rails generate model User first_name:string last_name:string email:string password:string
      rails generate model Category title:string
      rails generate model Document title:string text:text category references
      rails generate scaffold_controller User first_name:string last_name:string email:string password:string
      rails generate scaffold_controller Category title:string
      rails generate model Categories_documents category:references document:references
      rails generate scaffold_controller Categories_documents category:references document:references

comandos utiles
	rails g devise:install
	rails g devise User
	(agregar a manopla los first_name y last_name en la migracion)
	rake db:migrate
	rails g devise:views
