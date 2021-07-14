from flask import Blueprint, flash, g, redirect, render_template, request, session, url_for
from ucrm.db import get_db
from ucrm.auth import login_required
from datetime import date

bp = Blueprint('dashboard', __name__, url_prefix = '/dashboard')

@bp.route('/', methods = ('GET', 'POST'))
@login_required
def dashboard():
    db = get_db()
    error = None

    g.users = [row['username'] for row in db.execute('SELECT username FROM user').fetchall()]

    g.last_user = "All"

    if request.method == 'POST':
        user = request.form['user']
        period = request.form['period']

        activity_types = {row['id']:row['name'] for row in db.execute('SELECT * FROM activity_type').fetchall()}
        activities = db.execute('SELECT activityid, duration FROM activity').fetchall()

        stats = {}
        for k, v in activity_types.items():
            stats[v] = 0

        for a in activities:
            aid = a["activityid"]
            aname = activity_types[aid]
            stats[aname] = stats[aname] + a["duration"]

        g.stats = stats
        g.activities = list(stats.keys())
        g.durations = list(stats.values())
        g.last_user = user
        g.last_period = period

    return render_template('dashboard.html')
