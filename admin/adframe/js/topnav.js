
	var layerNumShowing = 0;
	var topNavClicked	= 0;
	var MENUBARCOUNT	= 4;
	
	// wichtig:
	init();
	
	function init()
	{
        if (navigator.appName == "Netscape") {
				layerStyleRef="layer.";
				layerRef="document.layers";
				styleSwitch="";
        }else{
				layerStyleRef="layer.style.";
				layerRef="document.all";
				styleSwitch=".style";
		}
	}
	
	function showLayer(layerName)
	{
		eval(layerRef+'["'+layerName+'"]'+styleSwitch+'.visibility="visible"');
	}
	function hideLayer(layerName)
	{
		eval(layerRef+'["'+layerName+'"]'+styleSwitch+'.visibility="hidden"');
	}
	
	function showMenuNumber(number)
	{
		var layerNumToShow=number;
		hideLayer(eval('"menu' + layerNumShowing+'"'));
		showLayer(eval('"menu' + layerNumToShow+'"'));
		layerNumShowing=layerNumToShow;	
	}
	function hideMenuNumber(number)
	{
		hideLayer(eval('"menu' + layerNumShowing+'"'));
	}
	
	function showMenubarOver(number)
	{
		var manuname = "menubar"+number;
		var evString = layerRef+"['"+manuname+"']"+styleSwitch+".className='navbarover'";
		eval(layerRef+"['"+manuname+"']"+".className='navbarover'");
	}
	function showMenubarPressed(number)
	{
		var manuname = "menubar"+number;
		var evString = layerRef+"['"+manuname+"']"+styleSwitch+".className='navbarover'";
		eval(layerRef+"['"+manuname+"']"+".className='navbarpressed'");
	}
	function hideMenubar(number)
	{
		var manuname = "menubar"+number;
		eval(layerRef+"['"+manuname+"']"+".className='navbar'");
	}
	function hideAllMenubarsExcept(number)
	{
		for (i=1;i<=MENUBARCOUNT;i++)
		{
			if (number!=i)
			{
				hideMenubar(i);
			}
		}
	}
	
	function showMenu(number)
	{
		
		if (topNavClicked)
		{
			hideAllMenubarsExcept(number);
			showMenuNumber(number);			
			showMenubarPressed(number);
		}
		else
		{
			hideAllMenubarsExcept(number);
			showMenubarOver(number);
		}
	}
	function hideMenu(number)
	{
		hideMenuNumber(number);
	}
	
	function toggleTopnavMenuClicked()
	{
		topNavClicked = ! topNavClicked;
		if (topNavClicked==0)
		{
			hideAllMenubarsExcept(0);
			showMenuNumber(0);
		}
	}
	