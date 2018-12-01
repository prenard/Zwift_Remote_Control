using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class Zwift_Remote_ControlMenuDelegate extends Ui.MenuInputDelegate
{
	var app;
    //var my_App_Controller;

    function initialize()
    {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item)
    {
        app = App.getApp();
        if (item == :item_0) {app.SendAntCommand("View_0");} 
        else
        if (item == :item_1) {app.SendAntCommand("View_1");} 
        else
        if (item == :item_2) {app.SendAntCommand("View_2");} 
        else
        if (item == :item_3) {app.SendAntCommand("View_3");} 
        else
        if (item == :item_4) {app.SendAntCommand("View_4");}
        else
        if (item == :item_5) {app.SendAntCommand("View_5");} 
        else
        if (item == :item_6) {app.SendAntCommand("View_6");} 
        else
        if (item == :item_7) {app.SendAntCommand("View_7");} 
        else
        if (item == :item_8) {app.SendAntCommand("View_8");} 
        else
        if (item == :item_9) {app.SendAntCommand("View_9");}
        else
        if (item == :item_A) {app.SendAntCommand("DevicesPairing");}
    }
}