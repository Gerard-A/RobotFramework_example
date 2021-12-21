import requests


class LocationResource(object):
    def __init__(self, country_code, zip_code):

        self.country_code = country_code
        self.zip_code = zip_code
        self.url = "http://api.zippopotam.us/"

    def send_request(self):
        url = self.url + self.country_code + "/" + self.zip_code
        return requests.get(url)
