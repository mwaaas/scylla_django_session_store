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