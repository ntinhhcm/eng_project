# eng_project
This project include environment configurations based on docker component

**Init**
- Make folder follows as structure: `/var/log/apache2`
- Clone some required project git repositories to your local. Make sure same directory level where `docker-compose.yml` was placed at.

**Config**

Edit docker-compose file
1.  Open `docker-compose.yml`.
2. Goto line `57` change local directory to where you put folder `/var/log/apache2` in. Ideal, as **Init** section.
3. Save file.

Edit PHP dockerfile
1. Open `php/Dockerfile`
2. At line 1, change this line to `FROM <parent foleder>`.
3. Save file.

**Install**
1. At parent folder (where `docker-compose.yml` placed) open command line.
2. Type `docker-compose build` then enter.
3. After build done. Type `docker-compose up` then enter.
4. Waiting for install progress completely.