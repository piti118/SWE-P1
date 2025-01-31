def test_home_page(client):
    response = client.get("/", follow_redirects=True)
    assert b"LOGIN" in response.data
    assert response.status_code == 200
