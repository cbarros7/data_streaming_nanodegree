"""Defines trends calculations for stations"""
import logging

import faust


logger = logging.getLogger(__name__)


# Faust will ingest records from Kafka in this format
class Station(faust.Record):
    stop_id: int
    direction_id: str
    stop_name: str
    station_name: str
    station_descriptive_name: str
    station_id: int
    order: int
    red: bool
    blue: bool
    green: bool


# Faust will produce records to Kafka in this format
class TransformedStation(faust.Record):
    station_id: int
    station_name: str
    order: int
    line: str


# TODO: Define a Faust Stream that ingests data from the Kafka Connect stations topic and
#   places it into a new topic with only the necessary information.
app = faust.App("stations-stream", broker="kafka://localhost:9092", store="memory://")
# TODO: Define the input Kafka Topic. Hint: What topic did Kafka Connect output to?
topic = app.topic("com.cta.stations", value_type=Station) # CTA_ is the prefixd difined on producers/connector.py line 60
# TODO: Define the output Kafka Topic
out_topic = app.topic("com.cta.stations.transformed", partitions=1)
# TODO: Define a Faust Table
table = app.Table(
   "stations_sum",
   default=TransformedStation, # TransformedStation object type
   partitions=1,
   changelog_topic=out_topic,
)

#
#
# TODO: Using Faust, transform input `Station` records into `TransformedStation` records. Note that
# "line" is the color of the station. So if the `Station` record has the field `red` set to true,
# then you would set the `line` of the `TransformedStation` record to the string `"red"`
#
#

@app.agent(topic)
async def transform_station(stations):
    async for stationevent in stations:
        #print(stationevent)

        line = None
        if stationevent.red:
            line = "red"
        elif stationevent.blue:
            line = "blue"
        else:
            line = "green"

        # We need to add those data to the table not sending them as topics due to the rubric
        # and use the station_id as a Table ID that contains transformed data.

        # We use the table as we will only have the latest station and when another station
        # comes up for the same id it will overwrite the old one. Then we will have the latest
        # record for each station.
        transformed_station = TransformedStation(stationevent.station_id, 
                                                stationevent.station_name, 
                                                stationevent.order,
                                                line)
        table[stationevent.station_id] = transformed_station

if __name__ == "__main__":
    app.main()
