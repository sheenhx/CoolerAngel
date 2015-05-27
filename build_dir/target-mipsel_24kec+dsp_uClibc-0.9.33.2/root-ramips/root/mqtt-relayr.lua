mqtt = require("mosquitto")
client = mqtt.new()

client.ON_CONNECT = function()
        print("connected")
        client:subscribe("/temp/#")
end

client.ON_MESSAGE = function(mid, topic, payload)
        print(topic, payload)
end

broker = arg[1] -- defaults to "localhost" if arg not set
client:connect(broker)
client:loop_forever()
