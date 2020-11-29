from app.main import handler


def test_handler():
    assert handler(None, None) == 'Hello AWS Lambda from Bitbucket Pipelines!'
