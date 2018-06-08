<a href="https://codecov.io/gh/mwaaas/scylla_django_session_store">
  <img src="https://codecov.io/gh/mwaaas/scylla_django_session_store/branch/master/graph/badge.svg" />
</a>
<a class="badge-align" href="https://www.codacy.com/app/francismwangi152/scylla_django_session_store?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mwaaas/scylla_django_session_store&amp;utm_campaign=Badge_Grade"><img src="https://api.codacy.com/project/badge/Grade/9309a2b02a934da0854fb53a4621d705"/></a>


django-cassandra-sessions
=========================

This is a session backend for Django that stores sessions in Scylla and Cassandra,
using the pycassa library.  

Installing django-cassandra-sessions
------------------------------------

1. Install with this command ``pip install scylla-django-session-store``, 

2. Set ``scylla_sessions.sessions`` as your session engine, like so::

       SESSION_ENGINE = 'scylla_sessions.sessions'


3. (optional) Add settings describing where to connect to Scylla/Cassandra::

       SCYLLA_HOST = '127.0.0.1'  
       SCYLLA_PORT = '9042'
       SESSION_KEYSPACE = 'sessions'
       SESSION_TABLE = 'sessions'
       
4. Add ``scylla_sessions``  in INSTALLED_APPS
        
            INSTALLED_APPS = [
                .....
                scylla_sessions
                .....
            ]
       
5. Run this command to create table in Scylla/Cassandra
        
        python manage.py create_scylla_session_table