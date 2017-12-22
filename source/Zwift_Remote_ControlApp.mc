
// Minimum CIQ level = 2.1 : Because application use in user interface (UI) Buttons

using Toybox.Application as App;
using Toybox.WatchUi as Ui;


class Zwift_Remote_ControlApp extends App.AppBase
{
	var my_ANT_Generic_CTRL;
	var Garmin_Device_Type;
    var my_App_Controller;
	
	var current_view = 0;
	
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

	// Buttons Management:

	//
	// ANT command codes:
	//
	// 32768 - Down
	// 32769 - Up
	// 32770 - Right
	// 32771 - Left
	// 32772 - SpaceBar
	// 32773 - Enter
	// 32774 - G
	// 32775 - ESC
	// 32776 - F10 = Snapshot
	// 32777 - SwitchView
	// 32778 - F1 = ElbowFlick
	//
	// 32780 - 0 = View 0
	// 32781 - 1 = View 1
	// 32784 - 4 = View 4
	// 32785 - 5 = View 5
	// 32786 - 6 = View 6
	// 32787 - 7 = View 7
	// 32788 - 8 = View 8
	// 32789 - 9 = View 9
	//
	
    function SendAntCommand(cmd)
    {
		System.println("About to SendANTCommand for " + cmd);

		if (cmd.equals("Down"))			{my_ANT_Generic_CTRL.Send_Command(32768);}
        else
		if (cmd.equals("UP")) 			{my_ANT_Generic_CTRL.Send_Command(32769);}
        else
		if (cmd.equals("Right"))		{my_ANT_Generic_CTRL.Send_Command(32770);}
        else
		if (cmd.equals("Left"))			{my_ANT_Generic_CTRL.Send_Command(32771);}
		else
		if (cmd.equals("SpaceBar"))		{my_ANT_Generic_CTRL.Send_Command(32772);}
		else
		if (cmd.equals("Enter"))		{my_ANT_Generic_CTRL.Send_Command(32773);}
		else
		if (cmd.equals("G"))			{my_ANT_Generic_CTRL.Send_Command(32774);}
		else
		if (cmd.equals("ESC"))			{my_ANT_Generic_CTRL.Send_Command(32775);}
		else
		if (cmd.equals("Snapshot"))		{my_ANT_Generic_CTRL.Send_Command(32776);}
		else	
		if (cmd.equals("SwitchView"))	{my_ANT_Generic_CTRL.Send_Command(32777);}
		else	
		if (cmd.equals("ElbowFlick"))	{my_ANT_Generic_CTRL.Send_Command(32778);}
		else	

		if (cmd.equals("View0"))	{my_ANT_Generic_CTRL.Send_Command(32780);}
		else	
		if (cmd.equals("View1"))	{my_ANT_Generic_CTRL.Send_Command(32781);}
		else	
		if (cmd.equals("View2"))	{my_ANT_Generic_CTRL.Send_Command(32782);}
		else	
		if (cmd.equals("View3"))	{my_ANT_Generic_CTRL.Send_Command(32783);}
		else	
		if (cmd.equals("View4"))	{my_ANT_Generic_CTRL.Send_Command(32784);}
		else	
		if (cmd.equals("View5"))	{my_ANT_Generic_CTRL.Send_Command(32785);}
		else	
		if (cmd.equals("View6"))	{my_ANT_Generic_CTRL.Send_Command(32786);}
		else	
		if (cmd.equals("View7"))	{my_ANT_Generic_CTRL.Send_Command(32787);}
		else	
		if (cmd.equals("View8"))	{my_ANT_Generic_CTRL.Send_Command(32788);}
		else	
		if (cmd.equals("View9"))	{my_ANT_Generic_CTRL.Send_Command(32789);}

    }

}
