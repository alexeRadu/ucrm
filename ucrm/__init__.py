import os

from flask import Flask, render_template, g, request, session, url_for, redirect
from ucrm.db import get_db

def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config = True)
    app.config.from_mapping(
            SECRET_KEY = 'dev',
            DATABASE = os.path.join(app.instance_path, 'crm.sqlite'),
            )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent = True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route("/hello")
    def hello():
        return "Hello, World!"

    @app.route("/activity", methods = ('GET', 'POST'))
    def activity():
        user_id = session.get('user_id')

        if user_id is None:
            return redirect(url_for('auth.login'))

        db = get_db()
        error = None

        activity_types = [row['name'] for row in db.execute('SELECT name FROM activity_type').fetchall()]
        g.activity_types = activity_types

        if request.method == 'POST':
            activity = request.form['activity']
            hours = request.form['hours']
            user_id = 1

            print(f'activity: {activity}, hours: {hours}')

            activity_id = db.execute('SELECT id FROM activity_type WHERE name = ?', (activity,)).fetchone()['id']
            print("type: " + str(type(activity_id)))

            if activity_id is None:
                error = f'No activity {activity} found'
            else:
                db.execute('INSERT INTO activity (userid, activityid, hours) VALUES (?, ?, ?)', (user_id, activity_id, hours))
                db.commit()

        return render_template('activity.html')

    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)

    return app
