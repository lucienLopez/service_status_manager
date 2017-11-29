# About #

Exercice done to answer this (in French):

> Réaliser une appli rails de gestion des statuts de services.  
Chaque service possède généralement une page statut pour indiquer à leurs client si il sont up ou down.  
L’idée est d’avoir un agrégateur de cela.  
L’app doit avoir :  
    Au minimum :  
        Un model Service (name, url….)  
        Le système doit garder un historique des pings et envoyer un email à X si le service est down  
    Coté Front :  
        Une page affichant les services et leurs statuts (up/down)  
L’app doit permettre d’ajouter X services voici une liste non-exhaustives :  
https://developers.facebook.com/status/  
https://status.algolia.com/  
http://status.lithium.com/  
A toi de trouver une façon de sonder les pages (et plus précisément un élément de la page) ci-dessus (et d’autres services via une règle que tu auras déterminé).  
L’app n’a pas besoin de Ping en live et toutes les minutes si les X services sont Up. 
Un ping toutes les 5min est suffisant.  

# Used stack #

+ [Ruby](http://ruby-lang.org), => `2.3.3`
+ [Rails](http://rubyonrails.org), => `5.1.4`
+ [PostgreSQL](http://www.postgresql.org), => `9.6.6`

# Usage #

* Environment variables should be filled for emailing to work: GMAIL_USERNAME, GMAIL_PASSWORD, EMAIL_FROM, EMAIL_TO.
* `rake db:seed` can be used to import services (currently only one service working)
* To add other services, it is recommended to fill XPath and expected_content, otherwise only the url status code will be used.
* To check for status of all services at once, use `rake services:update_statuses`  
This task needs to be run once every  minutes to keep data fresh. This can be done by setting up a cron job.

# Remaining work #

We didn't write many tests, more should be added, particularly on services with XPath and on emails.
