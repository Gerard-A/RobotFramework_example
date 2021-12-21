from robot.api.deco import library
from robot.api.deco import keyword
from location_resource import LocationResource


@library(scope='TEST', version=0.1, auto_keywords=True)
class LocationResourceKeywords:

    def __init__(self):
        self.location_resource = None

    @keyword('Set country and zip code')
    def set_country_and_zip_code(self, country, zip_code):
        self.location_resource = LocationResource(country, zip_code)

    @keyword('Request the locations')
    def send_request(self):
        response = self.location_resource.send_request()
        return response
