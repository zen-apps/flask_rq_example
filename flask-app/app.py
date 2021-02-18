from flask import Flask
from some_job import test_rq
import worker
from rq import Queue

app = Flask(__name__)


@app.route('/hello')
def test_rq_workers():
    q = Queue(connection=worker.conn)
    result = q.enqueue(test_rq, some_name="jack")
    print(result)
    return str("test")
