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

    function onMenu()
    {
        Ui.pushView(new Rez.Menus.MainMenu(), new Zwift_Remote_ControlMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

    function sendScreenshot()
    {
        System.println("About to send Screenshot command.");
        return true;
    }

    function sendDown()
    {
        System.println("About to send Down command.");
        app.SendAntCommandDown();
        return true;
    }

    function sendRight()
    {
        System.println("About to send Right command.");
        //app.SendAntCommandRight();
        return true;
    }

}