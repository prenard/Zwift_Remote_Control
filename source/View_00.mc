using Toybox.WatchUi as Ui;

class View_00 extends Ui.View
 {

    function initialize()
    {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc)
    {
      	System.println("Screen Height  = " + dc.getHeight());
      	System.println("Screen Width  = " + dc.getWidth());
        setLayout(Rez.Layouts.Layout_00(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow()
    {
    }

    // Update the view
    function onUpdate(dc)
    {
		// Make compatible with non touch screen units like Edge 520
		//View.setKeyToSelectableInteraction(true);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide()
    {
    }

}
