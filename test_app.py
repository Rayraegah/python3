import pytest
import app as service

@pytest.fixture
def app():
    return service.app


def test_hello_world(app):
    r = app.requests.get("/")
    assert r.text == "hello, world!!"