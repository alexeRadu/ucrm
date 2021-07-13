from flask import Blueprint, flash, g, redirect, render_template, request, session, url_for
from ucrm.db import get_db
from ucrm.auth import login_required

bp = Blueprint('activity', __name__)

@bp.route("/", methods = ('GET', 'POST'))
@login_required
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
        time = request.form['time']
        details = request.form['details']
        user_id = 1

        activity_id = db.execute('SELECT id FROM activity_type WHERE name = ?', (activity,)).fetchone()['id']

        if activity_id is None:
            error = f'No activity {activity} found'
        else:
            db.execute('INSERT INTO activity (userid, activityid, time, details) VALUES (?, ?, ?, ?)', (user_id, activity_id, time, details))
            db.commit()

    return render_template('activity.html')

