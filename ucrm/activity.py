from flask import Blueprint, flash, g, redirect, render_template, request, session, url_for
from ucrm.db import get_db
from ucrm.auth import login_required

bp = Blueprint('activity', __name__)

@bp.route("/", methods = ('GET', 'POST'))
@login_required
def activity():
    user_id = session.get('user_id')

    db = get_db()
    error = None

    activity_types = db.execute('SELECT * FROM activity_type').fetchall()
    g.activity_types = [row['name'] for row in activity_types]
    activity_types = {row['id']: row['name'] for row in activity_types}

    activities = db.execute('SELECT activityid, time, duration, details FROM activity WHERE userid = ? ORDER BY DATE(time) DESC LIMIT 20', (user_id,)).fetchall()
    g.activities = [{
        'name': activity_types[a['activityid']],
        'time': a['time'],
        'duration': a['duration'],
        'details': a['details']} for a in activities]

    if request.method == 'POST':
        activity = request.form['activity']
        duration = request.form['duration']
        details = request.form['details']

        activity_id = db.execute('SELECT id FROM activity_type WHERE name = ?', (activity,)).fetchone()['id']

        if activity_id is None:
            error = f'No activity {activity} found'
        else:
            db.execute('INSERT INTO activity (userid, activityid, time, duration, details) VALUES (?, ?, DATE(\'now\'), ?, ?)', (user_id, activity_id, duration, details))
            db.commit()

    return render_template('activity.html')

