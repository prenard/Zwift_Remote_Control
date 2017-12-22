using Toybox.Application as App;
using Toybox.WatchUi as Ui;


class Zwift_Remote_ControlApp extends App.AppBase
{
	var my_ANT_Generic_CTRL;
	var Garmin_Device_Type;
    var my_App_Controller;
	
    function initialize()
    {
        AppBase.initialize();

        Garmin_Device_Type = Ui.loadResource(Rez.Strings.Device);
        System.println("Device Type = " + Garmin_Device_Type);
        my_ANT_Generic_CTRL = new ANT_Generic_CTRL();
    }

    // onStart() is called on application start up
    function onStart(state)
    {
        System.println("APP - onStart");
        my_ANT_Generic_CTRL = new ANT_Generic_CTRL();
        my_ANT_Generic_CTRL.open();
    }

    // onStop() is called when your application is exiting
    function onStop(state)
    {
    }

    // Return the initial view of your application here
    function getInitialView()
    {
        return [ new Zwift_Remote_ControlView(), new Zwift_Remote_ControlDelegate() ];
    }


    function SendAntCommandDown()
    {
        my_ANT_Generic_CTRL.Send_Command(32768);
    }

}
