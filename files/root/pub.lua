mqtt = require("mosquitto")
client = mqtt.new()

client.ON_CONNECT = function()
        client:publish("world", "hello,this is Sheen from relayr")
end

client.ON_PUBLISH = function()
    client:disconnect()
end

broker = arg[1] -- defaults to "localhost" if arg not set
client:connect(broker)
client:loop_forever()
