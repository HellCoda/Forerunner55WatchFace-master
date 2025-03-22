using Toybox.System;
using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Lang as Lang;
using Toybox.Application;

module BatteryIcon {

var locX;
var locY;
var width = 24;
var actualWidth = width + 2;
var height;

var dateHeight;

var totalWidth;

var batteryPercentage;

var displayPercentage = false;

var ICON_SIZE = 16;

function drawBattery(dc) {

dateHeight = dc.getFontHeight(dc.FONT_SYSTEM_TINY);
height = dateHeight - 14;

totalWidth = actualWidth + DateText.textWidth;

locX = dc.getWidth() / 2 + 55;
locY = dc.getHeight() / 2 - 48;

batteryPercentage = System.getSystemStats().battery / 100.0;

if (displayPercentage) {

//dc.drawBitmap(locX, locY, WatchUi.loadResource(Rez.Drawables.BatteryIcon));
batteryPercentage = Lang.format("$1$$2$", [(batteryPercentage * 100).format("%.0f"), "%"]);
actualWidth = dc.getTextWidthInPixels(batteryPercentage, dc.FONT_SYSTEM_TINY);

totalWidth = actualWidth + DateText.textWidth;

locX = (dc.getWidth() - totalWidth) / 2 - 5;

dc.drawText(locX, locY - 7, dc.FONT_SYSTEM_XTINY, batteryPercentage, dc.TEXT_JUSTIFY_LEFT);

} else {

// Draw outline
dc.setColor(dc.COLOR_WHITE, dc.COLOR_BLACK);
dc.setPenWidth(1);
dc.drawRectangle(locX, locY, width, height);

// Draw battery knob thing
dc.drawLine(locX + width + 1, locY + 2, locX + width + 1, locY + height - 2);

// Draw inside
batteryPercentage = System.getSystemStats().battery / 100.0;
if (batteryPercentage > 0.20) {
dc.setColor(dc.COLOR_GREEN, dc.COLOR_TRANSPARENT);
} else {
dc.setColor(dc.COLOR_RED, dc.COLOR_TRANSPARENT);
}
dc.fillRectangle(locX + 2, locY + 2, (width - 4) * batteryPercentage, height - 4);

// Draw percentage below the icon
var batteryText = Lang.format("$1$$2$", [(batteryPercentage * 100).format("%.0f"), "%"]);
var textWidth = dc.getTextWidthInPixels(batteryText, dc.FONT_SYSTEM_TINY);
var textX = locX + (width - textWidth) / 2 + 4;
var textY = locY + height + 5; // Adjust the value as needed

dc.setColor(dc.COLOR_WHITE, dc.COLOR_TRANSPARENT);
dc.drawText(textX, textY, dc.FONT_SYSTEM_XTINY, batteryText, dc.TEXT_JUSTIFY_LEFT);
}
}

function setSettings() {
displayPercentage = Application.getApp().getProperty("DisplayBatteryPercentage");
}
}