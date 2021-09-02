__# Analyse en composantes principales (ACP)__  
__# Classification ascendante hiérarchique__ 

Des études réalisées sur l’ensemble du territoire de la Guyane Française ont mis en évidence des imprégnations
par le mercure supérieures à la norme OMS dans les cheveux des populations amérindiennes vivant dans la
zone du Haut - Maroni. Cette contamination a été attribuée à la forte consommation par ces populations
de poissons des rivières, ces derniers étant considérés comme les vecteurs privilégiés du métal. En effet,
la contamination mercurielle peut être attribuée pour une part importante aux rejets métalliques liés aux
activités d’orpaillage car le mercure est largement utilisé pour ses propriétés d’amalgation avec les micro
particules d’or. 

Les données sont constituées de 80 poissons appartenant à 12 espèces et 4 régimes alimentaires.  
Les données sont détaillées selon 5 variables quantitatives: 
__MUSC__: qui représente la concentration du mercure dans les muscle. 
__INTE__: qui représente la concentration du mercure dans les intestins. 
__ESTO__: qui représente la concentration du mercure dans l'etomac. 
__FOIE__: qui représente la concentration du mercure dans la foie. 
__REIN__: qui représente la concentration du mercure dans les reins. 
Il y a aussi des variables qualitatives __ESPECE__ qui désigne l'espèce du poisson et __REGIME__ qui désigne son régime alimentaire.  

L'objectif était de classifier ces poissons en 4 classes selon le principe de __classification ascendante hiérarchique de Ward (CAH)__ et puis on a trouvé les caractéristiques de ces
4 classes à travers les variables quantitatives, ensuite on a utilisé ces classes là pour décrire les espèces et savoir les caractéristiques de chaque espèce. 
On a donc pu dire enfin pour chaque espèce , les caractéristiques de ses organes en concentration en mercure et on a pu alors donner des recommandations suite à cela. 
Par exemple si l'__espèce 1__ est incluse dans la __classe 1__, et la classe 1 est caractérisé par de fortes concentration de mercure dans les intestins, on recommande de ne pas consommer
les intestins lorsqu'on achète des poissons de cette espèce.

Le fichier __Projet_Moomen_Abid.R__ contient le code source de ce projet. 
Le fichier __ACP_CAH_Retour.pdf__ contient le rapport qui détaille ce qu'a été fait dans le projet. 
Le fichier __Poissons.rda__ contient la source de ce projet. 


