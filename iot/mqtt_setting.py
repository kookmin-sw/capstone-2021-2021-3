from fastapi_mqtt import FastMQTT, MQTTConfig
from gmqtt.mqtt.constants import MQTTv311

from config import mqtt_settings
from iot_utils.database import DBType, db
from iot_utils.logger import logger


class Mqtt:
    def __init__(self, settings) -> None:
        self.settings = settings

        self.organization = self.get_organization_info()
        self.device = self.get_device_info()

        self._mqtt = None
        if self.initialized:
            self._mqtt: FastMQTT = self.get_mqtt_app()
            self.add_handlers(self._mqtt)
        else:
            logger.error("Initialization is required.")

    @property
    def app(self):
        return self._mqtt

    @property
    def initialized(self):
        return self.organization and self.device

    async def re_initialize(self):
        if self.app:
            await self.app.client.disconnect()

        self.organization = self.get_organization_info()
        self.device = self.get_device_info()

        self._mqtt = self.get_mqtt_app()
        self.add_handlers(self._mqtt)
        await self._mqtt.connection()

    def get_mqtt_config(self):
        return MQTTConfig(
            username=self.settings.username,
            password=self.settings.password,
            host=self.settings.host,
            port=self.settings.port,
            version=MQTTv311,
        )

    def get_mqtt_app(self):
        return FastMQTT(config=self.get_mqtt_config())

    def get_organization_info(self):
        return db.find_one(DBType.organization)

    def get_device_info(self):
        return db.find_one(DBType.device)

    @property
    def device_id(self):
        return self.device.get("_id")

    @property
    def organization_id(self):
        return self.organization.get("_id")

    @property
    def topic_point_group(self):
        return f"device/point/{self.organization_id}/+"

    @property
    def topic_plastic_capacity(self):
        return f"device/capacity/plastic/{self.organization_id}/{self.device_id}"

    @property
    def topic_water_capacity(self):
        return f"device/capacity/water/{self.organization_id}/{self.device_id}"

    @property
    def topic_point(self):
        return f"device/point/{self.organization_id}/{self.device_id}"

    def add_handlers(self, app):
        @app.on_connect()
        def connect(client, flags, rc, properties):
            """MQTT Broker에 연결이 되었을 때 동작하는 Handler"""
            logger.info(f"Connected: {client}, {flags}, {rc}, {properties}")
            app.client.subscribe(self.topic_point_group)

        @app.on_disconnect()
        def disconnect(client, packet, exc=None):
            """MQTT Broker와 연결이 끊어졌을 때 동작하는 Handler"""
            logger.info(f"Disconnected client '{client._client_id}'")

        @app.on_subscribe()
        def subscribe(client, mid, qos, properties):
            """특정 Topic을 구독했을 때 동작하는 Handler"""
            logger.info(
                f"Subscribed client '{client._client_id}', {mid}, {qos}, {properties}"
            )

        @app.subscribe(self.topic_point_group)
        async def handle_data_topics(client, topic, payload, qos, properties):
            """TOPIC_POINT_GROUP Handler"""
            logger.info(f"point received! {topic}")


mqtt = Mqtt(mqtt_settings)
