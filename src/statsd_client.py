from statsd import StatsClient
import time


def client():
    return StatsClient(host='statsd-server',
                       port=8125,
                       prefix='hello',
                       maxudpsize=512)


def log_event():
    client().incr('foo.test')
    time.sleep(1)
    print("Sent event")


def increment():
    assert False


if __name__ == "__main__":
    while True:
        log_event()
