using Toybox.Ant as Ant;
using Toybox.WatchUi as Ui;
using Toybox.System as System;
using Toybox.Time as Time;

class ANT_Generic_CTRL extends Ant.GenericChannel
{
    const DEVICE_TYPE = 16;		// search for controllable device
    const PERIOD = 8192;

    hidden var chanAssign;

    var searching = true;
    var searching_timeout = false;
    
    var deviceCfg;

	var command_number = 0;

    function initialize()
    {
        // Get the channel
        chanAssign = new Ant.ChannelAssignment(
            Ant.CHANNEL_TYPE_RX_NOT_TX,
            Ant.NETWORK_PLUS);
        GenericChannel.initialize(method(:onMessage), chanAssign);
        // Set the configuration
        deviceCfg = new Ant.DeviceConfig( {
            :deviceNumber => 0,                 //Wildcard our search
            :deviceType => DEVICE_TYPE,
            :transmissionType => 0,
            :messagePeriod => PERIOD,
            :radioFrequency => 57,              //Ant+ Frequency
            :searchTimeoutLowPriority => 10,    //Timeout in 25s
            :searchTimeoutHighPriority => 2,    //Timeout in 5s
            :searchThreshold => 0} );           //Pair to all transmitting sensors
        GenericChannel.setDeviceConfig(deviceCfg);

        //data = new MO2Data();
        searching = true;
    }

    function open()
    {
		System.println("Connecting to ANT USB device...");
        // Open the channel
        if (GenericChannel.open())
        {
			System.println("ANT USB device initialization succesful");
        }
        else
        {
			System.println("ERROR: ANT USB device initialization unsuccesful");
        }
        
        searching = true;
        searching_timeout = false;
    }

    function closeSensor()
    {
        GenericChannel.close();
    }

    function onMessage(msg)
    {
        //System.println("Ant Msg ID = " + msg.messageId);
        // Parse the payload
        var payload = msg.getPayload();
        //System.println("payload[0] = " + payload[0].toNumber());

		// Channel Event
		if(msg.messageId == Ant.MSG_ID_CHANNEL_RESPONSE_EVENT)
		{
			var event = payload[1].toNumber();
        	System.println("CODE_EVENT = " + event);
        	if (event == MSG_CODE_EVENT_RX_SEARCH_TIMEOUT)
        	{
				searching = true;
        		searching_timeout = true;
        	}
		}

		// Broadcast Data
        if( Ant.MSG_ID_BROADCAST_DATA == msg.messageId )
        {
            if(searching)
            {
	        	searching = false;
    	    	deviceCfg = GenericChannel.getDeviceConfig();
        		System.println("ANT device number = " + deviceCfg.deviceNumber);
        		System.println("ANT device type = " + deviceCfg.deviceType);

        	}
        }
    	Ui.requestUpdate();

    }

    function Send_Command(cmd_number)
    {
        System.println("About to send ANT command number = " + cmd_number);
		var cmd_number6;
		var cmd_number7;
		
		if (cmd_number < 32768)
		{
			cmd_number6 = cmd_number;
			cmd_number7 = 0x00;
		}
		else
		{
			cmd_number6 = cmd_number - 32768;
			cmd_number7 = 0x80;
		}

		command_number++;

		var payload = new [8];

    	payload[0] = 0x49; 	// Command data page - 73 0x49
		payload[1] = 0x00; 	// Slave Serial Number
		payload[2] = 0x00; 	// Slave Serail Number
		payload[3] = 0x00; 	// Slave Manufacturer ID
		payload[4] = 0x00; 	// Slave Manufacturer ID
		payload[5] = command_number; 	// Sequence Number
		payload[6] = cmd_number6; 	// Command Number Decimal
		payload[7] = cmd_number7; 	// Command Number

		var Command_Page_message = new Ant.Message();
		Command_Page_message.setPayload(payload);
		GenericChannel.sendAcknowledge(Command_Page_message);		

    }


}
    