from rq import get_current_job


def test_rq(some_name="some_name"):
    self_job = get_current_job()
    print('hi ' + some_name + ". Current job id: %s" % (self_job.id,))
