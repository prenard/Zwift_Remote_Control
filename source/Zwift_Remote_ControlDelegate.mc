using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class Zwift_Remote_ControlDelegate extends Ui.BehaviorDelegate
{
	var app;
    var my_App_Controller;

    function initialize()
    {
        BehaviorDelegate.initialize();
        app = App.getApp();
    }


    function sendDown() 		{app.SendAntCommand("Down");}
    function sendUp() 			{app.SendAntCommand("Up");}
    function sendRight() 		{app.SendAntCommand("Right");}
    function sendLeft() 		{app.SendAntCommand("Left");}
    function sendSpaceBar() 	{app.SendAntCommand("SpaceBar");}
    function sendEnter() 		{app.SendAntCommand("Enter");}
    function sendG() 			{app.SendAntCommand("G");}
    function sendGraph() 		{app.SendAntCommand("G");}
    function sendESC() 			{app.SendAntCommand("ESC");}
    function sendSnapshot() 	{app.SendAntCommand("Snapshot");}
    function sendElbowFlick() 	{app.SendAntCommand("ElbowFlick");}
    function sendPgUp() 		{app.SendAntCommand("PgUp");}
    function sendPgDown() 		{app.SendAntCommand("PgDown");}
    function sendSkipBlock()	{app.SendAntCommand("Tab");}
        
    function sendSwitchView()
    {
    	app.current_view = (app.current_view + 1) % 10;
    	var view = "View_" +  app.current_view;
    	//System.println("View = " + view);
    	app.SendAntCommand(view);
    }


    function onMenu()
    {
        Ui.pushView(new Rez.Menus.MainMenu(), new Zwift_Remote_ControlMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

	function onKey(event)
    {
		// Implements events:
		//
		//    18 = START
		//    19 = LAP 
		//

    	System.println("Device_Type = " + app.Garmin_Device_Type);
        System.println("Event = " + event.getKey() );
        
 		if(Ui.KEY_LAP == event.getKey())
 		{
        	// 19 - LAP
        	System.println("Key = LAP");
        	app.SendAntCommand(app.Lap_Button_Action);
		}
 		else
 		if(Ui.KEY_START == event.getKey())
 		{
        	// 18 - START
        	System.println("Key = START");
        	app.SendAntCommand(app.Start_Button_Action);
		}
 		
    }

	function onSwipe( swipeEvent )
	{
        System.println("onSwipe = " + swipeEvent.getDirection());
		if (swipeEvent.getDirection() == Ui.SWIPE_UP)
		{
			System.println("onSwipe = Swipe_Up");
		}
		else
		if (swipeEvent.getDirection() == Ui.SWIPE_DOWN)
		{
			System.println("onSwipe = Swipe_Down");
		}
		if (swipeEvent.getDirection() == Ui.SWIPE_RIGHT)
		{
			System.println("onSwipe = Swipe_Right");
			app.Remote_Control_View_Idx = (app.Remote_Control_View_Idx + app.Remote_Control_View.size() - 1) % app.Remote_Control_View.size();
			System.println("Remote_Control_View_Idx = " + app.Remote_Control_View_Idx);
        	//Ui.switchToView(app.Remote_Control_View[app.Remote_Control_View_Idx], app.myZwift_Remote_ControlDelegate, Ui.SLIDE_RIGHT);
        	Ui.switchToView(app.Remote_Control_View[app.Remote_Control_View_Idx], self, Ui.SLIDE_RIGHT);
		}
		if (swipeEvent.getDirection() == Ui.SWIPE_LEFT)
		{
			System.println("onSwipe = Swipe_Left");
			app.Remote_Control_View_Idx = (app.Remote_Control_View_Idx + 1) % app.Remote_Control_View.size();
			System.println("Remote_Control_View_Idx = " + app.Remote_Control_View_Idx);
        	Ui.switchToView(app.Remote_Control_View[app.Remote_Control_View_Idx], self, Ui.SLIDE_LEFT);
		}
	}
}