import redis
from rq import Worker, Queue, Connection

listen = ['default']

try:
    conn = redis.from_url('redis://localhost:6379/0')
    print('REDIS', conn.config_get('maxmemory'))
except Exception as e:
    print('worker', e)

if __name__ == '__main__':
    with Connection(conn):
        worker = Worker(map(Queue, listen))
        worker.work()
