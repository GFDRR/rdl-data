CREATE ROLE commonusers NOLOGIN NOINHERIT;
CREATE ROLE commonviewer NOLOGIN INHERIT;
CREATE ROLE commoncontrib NOLOGIN INHERIT;
GRANT commonusers TO commonviewer;
GRANT commonviewer TO commoncontrib;

CREATE ROLE hazardusers NOLOGIN NOINHERIT;
CREATE ROLE hazardviewer NOLOGIN INHERIT;
CREATE ROLE hazardcontrib NOLOGIN INHERIT;
GRANT commonusers TO hazardusers;
GRANT hazardusers TO hazardviewer;
GRANT hazardviewer TO hazardcontrib;

CREATE ROLE ged4allusers NOLOGIN NOINHERIT;
CREATE ROLE ged4allviewer NOLOGIN INHERIT;
CREATE ROLE ged4allcontrib NOLOGIN INHERIT;
CREATE ROLE gedcf NOLOGIN INHERIT;
GRANT commonusers TO ged4allusers;
GRANT ged4allusers TO ged4allviewer;
GRANT ged4allviewer TO ged4allcontrib;
GRANT ged4allcontrib TO gedcf;

CREATE ROLE lossusers NOLOGIN NOINHERIT;
CREATE ROLE lossviewer NOLOGIN INHERIT;
CREATE ROLE losscontrib NOLOGIN INHERIT;
GRANT commonusers TO lossusers;
GRANT lossusers TO lossviewer;
GRANT lossviewer TO losscontrib;

CREATE ROLE moverusers NOLOGIN NOINHERIT;
CREATE ROLE moverviewer NOLOGIN INHERIT;
CREATE ROLE movercontrib NOLOGIN INHERIT;
GRANT commonusers TO moverusers;
GRANT moverusers TO moverviewer;
GRANT moverviewer TO movercontrib;
