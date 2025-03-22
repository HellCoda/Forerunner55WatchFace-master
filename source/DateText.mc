using Toybox.System;
using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Time.Gregorian;
using Toybox.Time;
using Toybox.Lang as Lang;
using Toybox.Application;

module DateText {

	var date;
	var dateString;
	
	var textWidth;
	var textWidthHour;
	
	var textHeightHour;
	
	var locX;
	var locY;

	function drawDate(dc) {
	
		date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
		
		dateString = date.day_of_week;
		dateString += " " + date.day;
		
		textHeightHour = dc.getFontHeight(Fonts.bigFilledFont);
		textWidth = dc.getTextWidthInPixels(dateString, ((dc.getWidth() > 208) ? dc.FONT_SYSTEM_TINY : dc.FONT_SYSTEM_XTINY));
		textWidthHour = dc.getTextWidthInPixels(date.hour.format("%02d"), Fonts.bigFilledFont);
		
		locX = (dc.getWidth() - textWidth - BatteryIcon.actualWidth) / 2 + BatteryIcon.actualWidth - 15;
		locY = dc.getHeight() / 2 - textHeightHour - 30;

		dc.setColor(dc.COLOR_BLUE, dc.COLOR_TRANSPARENT);
		dc.drawText(locX, locY, ((dc.getWidth() > 208) ? dc.FONT_SYSTEM_TINY : dc.FONT_SYSTEM_XTINY), dateString, Graphics.TEXT_JUSTIFY_LEFT);
	
	}

}