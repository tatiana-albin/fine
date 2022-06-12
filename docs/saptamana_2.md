## Saptamana 2

### Creare proiect personal github (repo)

https://github.com/new - creare repository nou

Va fi nevoie sa creem un personal access token, acesta va fi folosit de Jenkins pentru a comunica cu repo-ul nostru.
https://docs.github.com/en/enterprise-server@3.4/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

git clone https://github.com/Obfuskated/mentorat-devops.git

De copiat urmatoarele fisiere in repo-ul personal: 

jenkins/
src/
docker-compose.yml
Dockerfile
Jenkinsfile
Makefile

### Rulare aplicatie python demo local

Rulam `make demo-app-build` pentru a construi imaginea Docker pe care va rula aplicatia noastra de demo.
Rulam `make demo-app-start` pentru a rula aplicatia web de demo.

Mesajul ```Hey, avem Python intrun Docker container!``` va fi afisat la http://localhost:5000 daca toti pasii au fost rulati cu succes.

### Rulare Jenkins local

Rulam `make jenkins-start` pentru a rula serviciul Jenkins

Dupa cateva minute, Jenkins va fi initializat si va putea fi accesat la http://localhost:8080. Vom urmari pasii de setup initial, iar parola de inceput o vom obtine citind logurile aplicatiei prin intermediul Docker `docker logs jenkins`

### Adaugare pipeline in Jenkins 

https://www.jenkins.io/doc/book/pipeline/jenkinsfile/
Vom adauga un job nou prin care Jenkins va citi proiectul nostru GitHub, mai exact va interpreta fisierul `Jenkinsfile` in care noi definim stagiile pipeline-ului nostru CI/CD.
