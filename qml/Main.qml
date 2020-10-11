/*
 * Copyright (C) 2020  P Helion
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * QuickConversions is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.2
// Currently using Ubuntu.Components for i18n.tr() translations function
import Ubuntu.Components 1.3 as UT

ApplicationWindow {
    id: theApplication
    visible: true
    width: 400
    height: 600
    minimumWidth: 360
    minimumHeight: 450
    title: i18n.tr("Quick Conversions")
    color: backgroundColour
    
    Component.onCompleted: { currentPage.visible = true }
    
    Settings {
        id: persistent
        // Persistent pageIndex, showingAlt and returnToThisPage Values
        property alias persistentPageIndex: theApplication.pageIndex
        property alias persistentShowingAlt: theApplication.showingAlt
        property alias persistentReturnToThisPage: theApplication.returnToThisPage
        
        // Persistent Colour Settings
        property alias persistentBgRed: bgSliderRed.value
        property alias persistentBgGreen: bgSliderGreen.value
        property alias persistentBgBlue: bgSliderBlue.value
        property alias persistentinkRed: inkSliderRed.value
        property alias persistentinkGreen: inkSliderGreen.value
        property alias persistentinkBlue: inkSliderBlue.value
        
        // Persistent Slider Values
        property alias persistentCentigradeSliderValue: centiSlider.value
        property alias persistentFahrenheitSliderValue: fahrenSlider.value
        property alias persistentKgSliderValue: kgSlider.value
        property alias persistentLbsSliderValue: lbsSlider.value
        property alias persistentCmSliderValue: cmSlider.value
        property alias persistentInchesSliderValue: inchesSlider.value
        property alias persistentKmSliderValue: kmSlider.value
        property alias persistentMilesSliderValue: milesSlider.value
        
        // Persistent Max/Min SpinBox and Switch Values
        property alias persistentCentigradeMax: centigradeMaxSpinBox.value
        property alias persistentCentigradeMin: centigradeMinSpinBox.value
        property alias persistentFahrenheitMax: fahrenheitMaxSpinBox.value
        property alias persistentFahrenheitMin: fahrenheitMinSpinBox.value
        
        property alias persistentKgMax: kgMaxSpinBox.value
        property alias persistentLbsMax: lbsMaxSpinBox.value
        property alias persistentStoneSwitch: stoneSwitch.checked
        property alias persistentWeightPoint5Switch: weightPoint5Switch.checked
        
        property alias persistentcmMax: cmMaxSpinBox.value
        property alias persistentinchesMax: inchesMaxSpinBox.value
        property alias persistentHeightPoint5Switch: heightPoint5Switch.checked
        
        property alias persistentkmMax: kmMaxSpinBox.value
        property alias persistentmilesMax: milesMaxSpinBox.value
        property alias persistentDistancePoint5Switch: distancePoint5Switch.checked
        
        
    } //persistent Settings
    
    
    // **********************
    //    Default Settings
    // **********************
    property int centigradeDefaultMax: 50
    property int centigradeDefaultMin: -20
    
    property int fahrenheitDefaultMax: 120
    property int fahrenheitDefaultMin: 0
    
    property int kgDefaultMax: 130
    property int lbsDefaultMax: 280
    
    property int cmDefaultMax: 220
    property int inchesDefaultMax: 90
    
    property int kmDefaultMax: 330
    property int milesDefaultMax: 200
    
    
    // ***************
    //    Precision
    // ***************
    property int temperaturePrecision: 1
    property int weightPrecision: 2
    property int heightPrecision: 2
    property int distancePrecision: 2
    
    property var weightStepSize: weightPoint5Switch.checked ? 0.5 : 1
    property var heightStepSize: heightPoint5Switch.checked ? 0.5 : 1
    property var distanceStepSize: distancePoint5Switch.checked ? 0.5 : 1
    
    
    // *******************
    //    Fonts & Sizes
    // *******************
    property var standardFontSize: 12
    property var settingsFontSize: 10
    property var bigFont: 22
    
    property var settingsHeight: 50
    property var headerHeight: 50
    
    
    // ********************
    //    Page Variables
    // ********************
    property int pageIndex: 0
    property var pageNameArray: [ page0, page1, page2, page3, page4, page5]
    
    property var currentPage: pageNameArray[pageIndex]
    
    property bool showingAlt: false
    property int returnToThisPage: 0
    
    
    property var pageTitleArray: [ i18n.tr("Centigrade To Fahrenheit"), i18n.tr("Kilograms To Pounds"), i18n.tr("Centimetres To Inches"), i18n.tr("Kilometres To Miles"), i18n.tr("Settings"), i18n.tr("Colour Scheme")]
    
    property var pageTitleAltArray: [ i18n.tr("Fahrenheit To Centigrade"), i18n.tr("Pounds To Kilograms"), i18n.tr("Inches To Centimetres"), i18n.tr("Miles To Kilometres"), i18n.tr("Settings"), i18n.tr("Colour Scheme") ]
    
    property string currentPageTitle: (showingAlt) ? pageTitleAltArray[pageIndex] : pageTitleArray[pageIndex]
    
    
    // *******************
    //    Colour Scheme
    // *******************
    
    // Background - Dark Aubergine
    property int defaultBgRed: 0x2c
    property int defaultBgGreen: 0x00
    property int defaultBgBlue: 0x1e
    
    property string bgRedString: bgSliderRed.value < 16 ? "0" + bgSliderRed.value.toString(16) : bgSliderRed.value.toString(16)
    
    property string bgGreenString: bgSliderGreen.value < 16 ? "0" + bgSliderGreen.value.toString(16) : bgSliderGreen.value.toString(16)
    
    property string bgBlueString: bgSliderBlue.value < 16 ? "0" + bgSliderBlue.value.toString(16) : bgSliderBlue.value.toString(16)

    
    property string backgroundColour: "#" + bgRedString + bgGreenString + bgBlueString 
    
    
    // Ink - Ubuntu Orange
    property int defaultInkRed: 0xe9
    property int defaultInkGreen: 0x54
    property int defaultInkBlue: 0x20
    
    property string inkRedString: inkSliderRed.value < 16 ? "0" + inkSliderRed.value.toString(16) : inkSliderRed.value.toString(16)
    
    property string inkGreenString: inkSliderGreen.value < 16 ? "0" + inkSliderGreen.value.toString(16) : inkSliderGreen.value.toString(16)
    
    property string inkBlueString: inkSliderBlue.value < 16 ? "0" + inkSliderBlue.value.toString(16) : inkSliderBlue.value.toString(16)
    
    
    property string inkColour: "#" + inkRedString + inkGreenString + inkBlueString
    
    
    // Popup Colours
    property string popupBackgroundColour: "black"
    property string popupTextColour: ( (bgSliderRed.value > 220) && (bgSliderGreen.value > 220) && (bgSliderBlue.value > 220) ) ? "black" : "white"
    property string popupBorderColour: "#060606"
    
    
    
    // ***************************
    //    Temperature Variables
    // ***************************
    property var fahrenheitValue: (centiSlider.value * 1.8) + 32
    property string fahrenheitString: fahrenheitValue.toFixed(temperaturePrecision)
    
    property var centigradeValue: (fahrenSlider.value - 32) / 1.8
    property string centigradeString: centigradeValue.toFixed(temperaturePrecision)
    
    property bool showingCentigrade: true
    
    
    // **********************
    //    Weight Variables
    // **********************
    property var lbsValue: kgSlider.value * 2.20462262185
    property string lbsString: lbsValue.toFixed(weightPrecision)
    
    property var kgValue: lbsSlider.value / 2.20462262185
    property string kgString: kgValue.toFixed(weightPrecision)
    
    property var stoneValue1: ~~(lbsValue / 14)
    property var stoneValue2: ~~(lbsSlider.value / 14)
    
    property var stoneRemainderValue1: lbsValue % 14
    property string stoneRemainderString1: stoneRemainderValue1.toFixed(weightPrecision)
    
    property var stoneRemainderValue2: lbsSlider.value % 14
    property string stoneRemainderString2: stoneRemainderValue2.toFixed(weightPrecision)
    
    
    // **********************
    //    Height Variables
    // **********************
    property var inchesValue: cmSlider.value * 0.3937007874
    property string inchesString: inchesValue.toFixed(heightPrecision)
    
    property var cmValue: inchesSlider.value / 0.3937007874
    property var cmString: cmValue.toFixed(heightPrecision)
    
    property var footValue1: ~~(inchesValue / 12)
    property var footValue2: ~~(inchesSlider.value / 12)
    
    property var footRemainderValue1: inchesValue % 12
    property var footRemainderString1: footRemainderValue1.toFixed(heightPrecision)
    
    property var footRemainderValue2: inchesSlider.value % 12
    
    
    // ************************
    //    Distance Variables
    // ************************
    property var milesValue: kmSlider.value * 0.62137119
    property string milesString: milesValue.toFixed(distancePrecision)
    
    property var kmValue: milesSlider.value / 0.62137119
    property string kmString: kmValue.toFixed(distancePrecision)

    
    // ****************
    //    mainHeader
    // ****************

    header: ToolBar {
        id: mainHeader
        
        background: Rectangle {
            id: headerBackgroundRectangle
            implicitHeight: headerHeight
            color: backgroundColour
            
            Rectangle {
                id: headerBottomLine
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
                color: "transparent"
                border.color: Qt.darker(backgroundColour)
                
            } //headerBottomLine
            
        } //headerBackgroundRectangle
        
        RowLayout {
            anchors.fill: parent
            
            Label {
                id: appTitle
                text: currentPageTitle
                color: inkColour
                font.pointSize: standardFontSize
                Layout.fillWidth: true
                Layout.leftMargin: standardFontSize
                
                MouseArea {
                    id: clickTitle
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    onClicked: {
                        if(!showingAlt) {
                            showingAlt = true
                        }
                        else {
                            showingAlt = false
                        }
                    } //onClicked
                } //clickTitle MouseArea
                
                
            } //appTitle
            
            ToolButton {
                id: settingsButton
                text: "⋮"
                width: headerHeight
                
                contentItem: Text {
                    text: settingsButton.text
                    color: inkColour
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                } //contentItem Text
                
                background: Rectangle {
                    implicitWidth: headerHeight
                    implicitHeight: headerHeight
                    anchors.fill: parent
                    color: "transparent"
                } //background Rectangle
                
                onClicked: {
                        // On Settings (or Colour Scheme) Page, return to previous page when clicked
                        if ( pageIndex == 4 || pageIndex == 5 ) {
                            currentPage.visible = false
                            pageIndex = returnToThisPage
                            currentPage.visible = true
                        }
                        else {
                            popupMenu.open()
                        }
                    } //onClicked
                    
            } //settingsButton
            
        } //RowLayout
            
            Popup {
                id: popupMenu
                x: parent.width * 0.1
                y: (page0.height * 0.1) + mainHeader.height
                width: parent.width * 0.8
                height: page0.height * 0.8
                focus: true
                modal: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                
                background: Rectangle {
                    id: popupRectangle
                    anchors.fill: parent
                    color: popupBackgroundColour
                    opacity: 0.75
                } //popupRectangle
                
                Rectangle {
                    id: optionsWrapper
                    width: parent.width * 0.9
                    height: parent.height * 0.9
                    color: backgroundColour
                    anchors.centerIn: parent
                
                    Rectangle {
                        id: option0
                        width: parent.width
                        height: parent.height/5
                        anchors.top: parent.top
                        color: "transparent"
                        border.color: popupBorderColour
                        border.width: 1
                        
                        Label {
                            id: option0Label
                            anchors.centerIn: parent
                            color: (option0MouseArea.containsMouse) ? inkColour : popupTextColour
                            text: i18n.tr("Temperature (°C/°F)")
                            font.pointSize: standardFontSize
                        } //option0Label
                        
                        MouseArea {
                            id: option0MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                
                                if(pageIndex != 0) {
                                    currentPage.visible = false
                                    pageIndex = 0
                                    currentPage.visible = true
                                }
                                
                                popupMenu.close()
                                
                            } //onClicked
                        } //MouseArea
                        
                    } //option0
                    
                    Rectangle {
                        id: option1
                        width: parent.width
                        height: parent.height/5
                        anchors.top: option0.bottom
                        color: "transparent"
                        border.color: popupBorderColour
                        border.width: 1
                        
                        Label {
                            id: option1Label
                            anchors.centerIn: parent
                            color: (option1MouseArea.containsMouse) ? inkColour : popupTextColour
                            text: i18n.tr("Weight (Kg/Lbs)")
                            font.pointSize: standardFontSize
                        } //option1Label
                        
                        MouseArea {
                            id: option1MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                
                                if(pageIndex != 1) {
                                    currentPage.visible = false
                                    pageIndex = 1
                                    currentPage.visible = true
                                }
                                
                                popupMenu.close()
                                
                            } //onClicked
                        } //MouseArea
                        
                    } //option1
                    
                    Rectangle {
                        id: option2
                        width: parent.width
                        height: parent.height/5
                        anchors.top: option1.bottom
                        color: "transparent"
                        border.color: popupBorderColour
                        border.width: 1
                        
                        Label {
                            id: option2Label
                            anchors.centerIn: parent
                            color: (option2MouseArea.containsMouse) ? inkColour :  popupTextColour
                            text: i18n.tr("Height (Cm/Inches)")
                            font.pointSize: standardFontSize
                        } //option2Label
                        
                        MouseArea {
                            id: option2MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                
                                if(pageIndex != 2) {
                                    currentPage.visible = false
                                    pageIndex = 2
                                    currentPage.visible = true
                                }
                                
                                popupMenu.close()
                                
                            } //onClicked
                        } //MouseArea
                        
                    } //option2

                    Rectangle {
                        id: option3
                        width: parent.width
                        height: parent.height/5
                        anchors.top: option2.bottom
                        color: "transparent"
                        border.color: popupBorderColour
                        border.width: 1
                        
                        Label {
                            id: option3Label
                            anchors.centerIn: parent
                            color: (option3MouseArea.containsMouse) ? inkColour :  popupTextColour
                            text: i18n.tr("Distance (Km/Miles)")
                            font.pointSize: standardFontSize
                        } //option3Label
                        
                        MouseArea {
                            id: option3MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                
                                if(pageIndex != 3) {
                                    currentPage.visible = false
                                    pageIndex = 3
                                    currentPage.visible = true
                                }
                                
                                popupMenu.close()
                                
                            } //onClicked
                        } //MouseArea
                        
                    } //option3
                    
                    
                    Rectangle {
                        id: option4
                        width: parent.width
                        height: parent.height/5
                        anchors.top: option3.bottom
                        color: "transparent"
                        border.color: popupBorderColour
                        border.width: 1
                        
                        Label {
                            id: option4Label
                            anchors.centerIn: parent
                            color: (option4MouseArea.containsMouse) ? inkColour :  popupTextColour
                            text: i18n.tr("Settings")
                            font.pointSize: standardFontSize
                        } //option4Label
                        
                        MouseArea {
                            id: option4MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                
                                if(pageIndex != 4) {
                                    returnToThisPage = pageIndex
                                    currentPage.visible = false
                                    pageIndex = 4
                                    currentPage.visible = true
                                }
                                
                                popupMenu.close()
                                
                            } //onClicked
                        } //MouseArea
                        
                    } //option4
                    
                } //optionsWrapper
                
            } //popupMenu
                    
            // ******************
            //    popupMenu Ends 
            // ******************

            
        } //mainHeader
        
        
        // ***********
        //    page0
        // ***********
        
        Rectangle {
            id: page0
            width: parent.width
            height: parent.height
            color: "transparent"
            anchors.top: parent.top
            visible: false
            
            Rectangle {
                id: centigrade2FahrenheitSection
                color: "transparent"
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                visible: (showingAlt) ? false : true
                    
                Rectangle {
                    id: centigradeLabel1
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.top: parent.top
                    
                    Label {
                        text: centiSlider.value + " °C"
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: bigFont
                    }
                    
                } //centigradeLabel1
                
                Rectangle {
                    id: centiSliderSection
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.top: centigradeLabel1.bottom
                    
                    Slider {
                        id: centiSlider 
                        width: parent.width/6 * 5
                        anchors.centerIn: parent
                        from: centigradeMinSpinBox.value
                        to: centigradeMaxSpinBox.value
                        value: 0
                        stepSize: 1
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //centiSlider
                    
                } //centiSliderSection
                
                Rectangle {
                    id: fahrenheitLabel1
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.bottom: parent.bottom
                    
                    Label {
                        text: fahrenheitString + " °F"
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: bigFont
                    }
                    
                } //fahrenheitLabel1
                
            } //centigrade2FahrenheitSection
            
            // ***************************************
            
            Rectangle {
                id: fahrenheit2CentigradeSection
                width: parent.width
                height: parent.height * 0.75
                color: "transparent"
                anchors.centerIn: parent
                visible: (showingAlt) ? true : false

                Rectangle {
                    id: fahrenheitLabel2
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.top: parent.top
                    
                    Label {
                        text: fahrenSlider.value + " °F"
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: bigFont
                    }
                    
                } //fahrenheitLabel2
                
                Rectangle {
                    id: fahrenSliderSection
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.top: fahrenheitLabel2.bottom
                    
                    Slider {
                        id: fahrenSlider 
                        width: parent.width/6 * 5
                        anchors.centerIn: parent
                        from: fahrenheitMinSpinBox.value
                        to: fahrenheitMaxSpinBox.value
                        value: 32
                        stepSize: 1
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //fahrenSlider
                    
                } //centiSliderSection
                    
                Rectangle {
                    id: centigradeLabel2
                    width: parent.width
                    height: parent.height/3
                    color: parent.color
                    anchors.bottom: parent.bottom
                    
                    Label {
                        text: centigradeString + " °C"
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: bigFont
                    }
                    
                } //centigradeLabel2

                
            } //fahrenheit2CentigradeSection
            
        } //page0
        
        // ***********
        //    page1
        // ***********
        
        Rectangle {
            id: page1
            width: parent.width
            height: parent.height
            color: "transparent"
            anchors.top: parent.top
            visible: false
            
            Rectangle {
                id: kgToPoundsSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? false : true
                
                Rectangle {
                    id: kgSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: kgLabel1
                        text: (weightPoint5Switch.checked) ? kgSlider.value.toFixed(1) + " kg" : kgSlider.value + " kg"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //kgLabel1
                    
                } //kgSection1
                
                Rectangle {
                    id: kgSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: kgSection1.bottom
                    color: parent.color
                    
                    Slider {
                        id: kgSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: kgMaxSpinBox.value
                        value: 0
                        stepSize: weightStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //kgSlider
                    
                } //kgSliderSection
                
                Rectangle {
                    id: lbsSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.bottom: parent.bottom
                    color: parent.color
                    
                    Label {
                        id: lbsLabel1
                        text: lbsString + " lbs"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //lbsLabel1
                    
                    Label {
                        id: stoneLabel1
                        text: "(" + stoneValue1 + " Stone  " + stoneRemainderString1 + " lbs)" 
                        anchors.top: lbsLabel1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: inkColour
                        font.pointSize: settingsFontSize
                        visible: stoneSwitch.checked ? true : false
                    } //stoneLabel1
                    
                } //lbsSection
                
            
            } //kgToPoundsSection
            
            Rectangle {
                id: poundsToKgSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? true : false
                
                Rectangle {
                    id: lbsSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: lbsLabel2
                        text: (weightPoint5Switch.checked) ? lbsSlider.value.toFixed(1) + " lbs" : lbsSlider.value + " lbs"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //lbsLabel2
                    
                    Label {
                        id: stoneLabel2
                        text: "(" + stoneValue2 + " Stone  " + stoneRemainderString2 + " lbs)" 
                        anchors.top: lbsLabel2.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: inkColour
                        font.pointSize: settingsFontSize
                        visible: stoneSwitch.checked ? true : false
                    } //stoneLabel2
                    
                } //lbsSection2
                
                Rectangle {
                    id: lbsSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: lbsSection2.bottom
                    color: parent.color
                    
                    Slider {
                        id: lbsSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: lbsMaxSpinBox.value
                        value: 0
                        stepSize: weightStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //lbsSlider
                    
                } //lbsSliderSection
                
                Rectangle {
                    id: kgSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.bottom: parent.bottom
                    color: parent.color
                    
                    Label {
                        id: kgLabel2
                        text: kgString + " kg"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //kgLabel2
                    
                } //kgSection2
            
            } //poundsToKgSection
            
        } //page1
        
        
        // ***********
        //    page2
        // ***********
        
        Rectangle {
            id: page2
            width: parent.width
            height: parent.height
            color: "transparent"
            anchors.top: parent.top
            visible: false
            
            Rectangle {
                id: cmToInchesSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? false : true
                
                Rectangle {
                    id: cmSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: cmLabel1
                        text: heightPoint5Switch.checked ? cmSlider.value.toFixed(1) + " cm" : cmSlider.value + " cm"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //cmLabel1
                    
                } //cmSection1
                
                Rectangle {
                    id: cmSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: cmSection1.bottom
                    color: parent.color
                    
                    Slider {
                        id: cmSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: cmMaxSpinBox.value
                        value: 0
                        stepSize: heightStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //cmSlider
                    
                } //cmSliderSection
                
                Rectangle {
                    id: inchesSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.top: cmSliderSection.bottom
                    color: parent.color
                    
                    Label {
                        id: footLabel1
                        text: footValue1 + " ft  " + footRemainderString1 + " inches"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //footLabel1
                    
                    Label {
                        id: inchesLabel1
                        text: "(" + inchesString + " inches)"
                        anchors.top: footLabel1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: inkColour
                        font.pointSize: settingsFontSize
                    } //inchesLabel1
                    
                } //inchesSection1
                
            } //cmToInchesSection

            Rectangle {
                id: inchesToCmSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? true : false
                
                Rectangle {
                    id: inchesSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: footLabel2
                        text: heightPoint5Switch.checked ? footValue2 + " ft  " + footRemainderValue2.toFixed(1) + " inches" : footValue2 + " ft  " + footRemainderValue2 + " inches"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //footLabel1
                    
                    Label {
                        id: inchesLabel2
                        text: heightPoint5Switch.checked ? "(" + inchesSlider.value.toFixed(1) + " inches)" : "(" + inchesSlider.value + " inches)"
                        anchors.top: footLabel2.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: inkColour
                        font.pointSize: settingsFontSize
                    } //inchesLabel2
                    
                } //inchesSection2
                
                Rectangle {
                    id: inchesSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: inchesSection2.bottom
                    color: parent.color
                    
                    Slider {
                        id: inchesSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: inchesMaxSpinBox.value
                        value: 0
                        stepSize: heightStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //inchesSlider
                    
                } //inchesSliderSection
                
                Rectangle {
                    id: cmSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.top: inchesSliderSection.bottom
                    color: parent.color
                    
                    Label {
                        id: cmLabel2
                        text: cmString + " cm"
                        anchors.centerIn: parent
                        color: inkColour
                        font.pointSize: bigFont
                    } //cmLabel2
                    
                } //cmSection2
                
            } //inchesToCmSection
            
        } //page2
        
        
        // ***********
        //    page3
        // ***********
        
        Rectangle {
            id: page3
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            color: "transparent"
            visible: false
            
            Rectangle {
                id: kmToMilesSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? false : true
                
                Rectangle {
                    id: kmSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: kmLabel1
                        anchors.centerIn: parent
                        color: inkColour
                        text: distancePoint5Switch.checked ? kmSlider.value.toFixed(1) + " km" : kmSlider.value + " km"
                        font.pointSize: bigFont
                    } //kmLabel1
                    
                } //kmSection1
                
                Rectangle {
                    id: kmSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: kmSection1.bottom
                    color: parent.color
                    
                    Slider {
                        id: kmSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: kmMaxSpinBox.value
                        value: 0
                        stepSize: distanceStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //kmSlider
                    
                } //kmSliderSection
                
                Rectangle {
                    id: milesSection1
                    width: parent.width
                    height: parent.height/3
                    anchors.top: kmSliderSection.bottom
                    color: parent.color
                    
                    Label {
                        id: milesLabel1
                        anchors.centerIn: parent
                        color: inkColour
                        text: milesString + " miles"
                        font.pointSize: bigFont
                    } //milesLabel1
                    
                } //milesSection1
                
            } //kmToMilesSection
            
            Rectangle {
                id: milesToKmSection
                width: parent.width
                height: parent.height * 0.75
                anchors.centerIn: parent
                color: "transparent"
                visible: (showingAlt) ? true : false
                
                Rectangle {
                    id: milesSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.top: parent.top
                    color: parent.color
                    
                    Label {
                        id: milesLabel2
                        anchors.centerIn: parent
                        color: inkColour
                        text: distancePoint5Switch.checked ? milesSlider.value.toFixed(1) + " miles" : milesSlider.value + " miles"
                        font.pointSize: bigFont
                    } //milesLabel2
                    
                } //milesSection2
                
                Rectangle {
                    id: milesSliderSection
                    width: parent.width
                    height: parent.height/3
                    anchors.top: milesSection2.bottom
                    color: parent.color
                    
                    Slider {
                        id: milesSlider
                        anchors.centerIn: parent
                        width: parent.width/6 * 5
                        from: 0
                        to: milesMaxSpinBox.value
                        value: 0
                        stepSize: distanceStepSize
                        live: true
                        snapMode: Slider.SnapAlways
                        
                    } //milesSlider
                    
                } //milesSliderSection
                
                Rectangle {
                    id: kmSection2
                    width: parent.width
                    height: parent.height/3
                    anchors.top: milesSliderSection.bottom
                    color: parent.color
                    
                    Label {
                        id: kmLabel2
                        anchors.centerIn: parent
                        color: inkColour
                        text: kmString + " km"
                        font.pointSize: bigFont
                    } //kmLabel2
                    
                } //kmSection2
                
            } //milesToKmSection
            
        } //page3
    
    
    
        // **********************
        //    page4 - Settings
        // **********************
        
        Rectangle {
            id: page4
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            color: "transparent"
            visible: false
            
            Flickable {
                width: parent.width
                height: parent.height
                contentWidth: parent.width
                contentHeight: settingsHeight * 20
                anchors.top: parent.top
                
                Column {
                    width: parent.width
                    spacing: 3
                
                    Rectangle {
                        id: goToColourScheme
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: parent.top
                        color: "transparent"
                        
                        MouseArea {
                            id: colourMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                currentPage.visible = false
                                pageIndex = 5
                                currentPage.visible = true
                            }
                        } //colourMouseArea
                        
                        Label {
                            text: i18n.tr("Colour Scheme")
                            anchors.centerIn: parent
                            font.pointSize: settingsFontSize
                            color: colourMouseArea.containsMouse ? inkColour : popupTextColour
                        }
                        
                        Rectangle {
                            id: goToColourSchemeSpacer
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                            color: "transparent"
                            border.color: Qt.darker(backgroundColour)
                        } //goToColourSchemeSpacer
                        
                    } //goToColourScheme
                    
                    Rectangle {
                        id: temperatureHeader
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: goToColourScheme.bottom
                        color: Qt.darker(backgroundColour)
                        
                        Label {
                            text: i18n.tr("Temperature")
                            color: inkColour
                            anchors.centerIn: parent
                            font.pointSize: settingsFontSize
                        }
                        
                    } //temperatureHeader
                    
                    Rectangle {
                        id: centigradeMaxSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: temperatureHeader.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: centigradeMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("°C Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //centigradeMaxLabel
                            
                            Rectangle {
                                id: centigradeMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: centigradeMaxSpinBox
                                    from: centigradeMinSpinBox.value + stepSize
                                    to: 3420 // (Tungsten's melting point)
                                    value: centigradeDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                    
                                } //centigradeMaxSpinBox
                                
                            } //centigradeMaxSpinBoxSection
                        
                    } //centigradeMaxSection
                    
                    Rectangle {
                        id: centigradeMinSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: centigradeMaxSection.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: centigradeMinLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("°C Min")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //centigradeMinLabel
                            
                            Rectangle {
                                id: centigradeMinSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: centigradeMinSpinBox
                                    from: -270 // (Absolute Zero is -273.15 °C)
                                    to: centigradeMaxSpinBox.value - stepSize
                                    value: centigradeDefaultMin
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                } //centigradeMinSpinBox
                                
                            } //centigradeMinSpinBoxSection
                        
                    } //centigradeMinSection

                    Rectangle {
                        id: fahrenheitMaxSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: centigradeMinSection.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: fahrenheitMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("°F Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //fahrenheitMaxLabel
                            
                            Rectangle {
                                id: fahrenheitMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: fahrenheitMaxSpinBox
                                    from: fahrenheitMinSpinBox.value + stepSize
                                    to: 6190 // (Tungsten melts at 6188 °F)
                                    value: fahrenheitDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                } //fahrenheitMaxSpinBox
                                
                            } //fahrenheitMaxSpinBoxSection
                        
                    } //fahrenheitMaxSection
                    
                    Rectangle {
                        id: fahrenheitMinSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: fahrenheitMaxSection.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: fahrenheitMinLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("°F Min")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //fahrenheitMinLabel
                            
                            Rectangle {
                                id: fahrenheitMinSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: fahrenheitMinSpinBox 
                                    from: -460 // (Absolute Zero is -459.67 °F)
                                    to: fahrenheitMaxSpinBox.value - stepSize
                                    value: fahrenheitDefaultMin
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                } //fahrenheitMinSpinBox
                                
                            } //fahrenheitMinSpinBoxSection
                        
                    } //fahrenheitMinSection
                    
                    Rectangle {
                        id: weightHeader
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: fahrenheitMinSection.bottom
                        color: Qt.darker(backgroundColour)
                        
                        Label {
                            text: i18n.tr("Weight")
                            color: inkColour
                            anchors.centerIn: parent
                            font.pointSize: settingsFontSize
                        }
                        
                    } //weightHeader
                    
                    Rectangle {
                        id: kgMaxSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: temperatureHeader.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: kgMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Kg Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //kgMaxLabel
                            
                            Rectangle {
                                id: kgMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: kgMaxSpinBox
                                    from: 0
                                    to: 190100 //Blue Whale (approx)
                                    value: kgDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                    
                                } //kgMaxSpinBox
                                
                            } //kgMaxSpinBoxSection
                        
                    } //lbsMaxSection
                    
                    Rectangle {
                        id: lbsMaxSection
                        width: parent.width
                        height: settingsHeight
                        //anchors.top: temperatureHeader.bottom
                        color: "transparent"
                            
                            Rectangle {
                                id: lbsMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Lbs Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //lbsMaxLabel
                            
                            Rectangle {
                                id: lbsMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: lbsMaxSpinBox
                                    from: 0
                                    to: 419000 //Blue Whale (approx)
                                    value: lbsDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                    
                                } //lbsMaxSpinBox
                                
                            } //lbsMaxSpinBoxSection
                        
                    } //lbsMaxSection
                    
                    Rectangle {
                        id: weightStepSwitchSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                        
                        Rectangle {
                            id: weightStepSwitchLabel
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.left: parent.left
                            
                            Label {
                                text: i18n.tr("0.5 Step Size")
                                color: inkColour
                                anchors.centerIn: parent
                                font.pointSize: settingsFontSize
                            }
                            
                        } //weightStepSwitchLabel
                        
                        Rectangle {
                            id: weightStepSwitch
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.right: parent.right
                            
                            Switch {
                                id:weightPoint5Switch
                                anchors.centerIn: parent
                                height: parent.height/2
                                width: parent.width/3
                                checked: false
                                
                                onClicked: {
                                    kgSlider.value = ~~(kgSlider.value/1)
                                    lbsSlider.value = ~~(lbsSlider.value/1)
                                } //onToggled
                                
                            } //Switch
                            
                        } //weightStepSwitch
                        
                    } //weightStepSwitchSection
                    
                    Rectangle {
                        id: showStoneSwitchSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                        
                        Rectangle {
                            id: showStoneSwitchLabel
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.left: parent.left
                            
                            Label {
                                text: i18n.tr("Show Stone")
                                color: inkColour
                                anchors.centerIn: parent
                                font.pointSize: settingsFontSize
                            }
                            
                        } //showStoneSwitchLabel
                        
                        Rectangle {
                            id: showStoneSwitch
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.right: parent.right
                            
                            Switch {
                                id:stoneSwitch
                                anchors.centerIn: parent
                                height: parent.height/2
                                width: parent.width/3
                                checked: true
                                
                            } //stoneSwitch
                            
                        } //showStoneSwitch
                        
                    } //showStoneSwitchSection
                    
                    Rectangle {
                        id: heightHeader
                        width: parent.width
                        height: settingsHeight
                        color: Qt.darker(backgroundColour)
                        
                        Label {
                            text: i18n.tr("Height")
                            color: inkColour
                            anchors.centerIn: parent
                            font.pointSize: settingsFontSize
                        }
                        
                    } //heightHeader
                    
                    Rectangle {
                        id: cmMaxSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                            
                            Rectangle {
                                id: cmMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Cm Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //cmMaxLabel
                            
                            Rectangle {
                                id: cmMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: cmMaxSpinBox
                                    from: 0
                                    to: 45800 //Length of Seawise Giant
                                    value: cmDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                } //cmMaxSpinBox
                                
                            } //cmMaxSpinBoxSection
                        
                    } //cmMaxSection
                    
                    Rectangle {
                        id: inchesMaxSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                            
                            Rectangle {
                                id: inchesMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Inches Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //inchesMaxLabel
                            
                            Rectangle {
                                id: inchesMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: inchesMaxSpinBox
                                    from: 0
                                    to: 18150 //Length of Seawise Giant
                                    value: inchesDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                } //inchesMaxSpinBox
                                
                            } //inchesMaxSpinBoxSection
                        
                    } //inchesMaxSection
                    
                    Rectangle {
                        id: heightStepSwitchSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                        
                        Rectangle {
                            id: heightStepSwitchLabel
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.left: parent.left
                            
                            Label {
                                text: i18n.tr("0.5 Step Size")
                                color: inkColour
                                anchors.centerIn: parent
                                font.pointSize: settingsFontSize
                            }
                            
                        } //heightStepSwitchLabel
                        
                        Rectangle {
                            id: heightStepSwitch
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.right: parent.right
                            
                            Switch {
                                id:heightPoint5Switch
                                anchors.centerIn: parent
                                height: parent.height/2
                                width: parent.width/3
                                checked: false
                                
                                onClicked: {
                                    cmSlider.value = ~~(cmSlider.value/1)
                                    inchesSlider.value = ~~(inchesSlider.value/1)
                                } //onToggled
                                
                            } //Switch
                            
                        } //heightStepSwitch
                        
                    } //heightStepSwitchSection
                
                Rectangle {
                        id: distanceHeader
                        width: parent.width
                        height: settingsHeight
                        color: Qt.darker(backgroundColour)
                        
                        Label {
                            text: i18n.tr("Distance")
                            color: inkColour
                            anchors.centerIn: parent
                            font.pointSize: settingsFontSize
                        }
                        
                    } //distanceHeader
                    
                    Rectangle {
                        id: kmMaxSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                            
                            Rectangle {
                                id: kmMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Km Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //kmMaxLabel
                            
                            Rectangle {
                                id: kmMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: kmMaxSpinBox
                                    from: 0
                                    to: 40080 //Circumference Of Earth is 40,075.017 km
                                    value: kmDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                    
                                } //kmMaxSpinBox
                                
                            } //kmMaxSpinBoxSection
                        
                    } //kmMaxSection
                    
                    Rectangle {
                        id: milesMaxSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                            
                            Rectangle {
                                id: milesMaxLabel
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.left: parent.left
                                
                                Label {
                                    text: i18n.tr("Miles Max")
                                    color: inkColour
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                }
                                
                            } //milesMaxLabel
                            
                            Rectangle {
                                id: milesMaxSpinBoxSection
                                width: parent.width/2
                                height: parent.height
                                color: parent.color
                                anchors.right: parent.right
                                
                                SpinBox {
                                    id: milesMaxSpinBox
                                    from: 0
                                    to: 24910 // Circumference Of Earth is 24,901.461 miles
                                    value: milesDefaultMax
                                    stepSize: 10
                                    anchors.centerIn: parent
                                    font.pointSize: settingsFontSize
                                    height: parent.height/3 * 2
                                    width: parent.width/3 * 2
                                    
                                } //milesMaxSpinBox
                                
                            } //milesMaxSpinBoxSection
                        
                    } //milesMaxSection
                    
                    Rectangle {
                        id: distanceStepSwitchSection
                        width: parent.width
                        height: settingsHeight
                        color: "transparent"
                        
                        Rectangle {
                            id: distanceStepSwitchLabel
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.left: parent.left
                            
                            Label {
                                text: i18n.tr("0.5 Step Size")
                                color: inkColour
                                anchors.centerIn: parent
                                font.pointSize: settingsFontSize
                            }
                            
                        } //distanceStepSwitchLabel
                        
                        Rectangle {
                            id: distanceStepSwitch
                            width: parent.width/2
                            height: parent.height
                            color: parent.color
                            anchors.right: parent.right
                            
                            Switch {
                                id:distancePoint5Switch
                                anchors.centerIn: parent
                                height: parent.height/2
                                width: parent.width/3
                                checked: false
                                
                                onClicked: {
                                    kmSlider.value = ~~(kmSlider.value/1)
                                    milesSlider.value = ~~(milesSlider.value/1)
                                } //onToggled
                                
                            } //Switch
                            
                        } //distanceStepSwitch
                        
                    } //distanceStepSwitchSection
                
                } //Column
                
            } //Flickable
            
        } //page4
    
    
    
        // ****************************
        //    page5 - Colour Scheme
        // ****************************
        
        Rectangle {
            id: page5
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            color: "transparent"
            visible: false
            
            Rectangle {
                id: bgColourSection
                width: parent.width
                height: parent.height/2
                anchors.top: parent.top
                color: "transparent"
                
                Rectangle {
                    id: bgHeader
                    width: parent.width
                    height: settingsHeight
                    color: Qt.darker(backgroundColour)
                    anchors.top: parent.top
                    
                    Label {
                        id: bgHeaderLabel
                        text: i18n.tr("Background")
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: settingsFontSize
                    } //bgHeaderLabel
                    
                } //bgHeader
                
                Rectangle {
                    id: bgSliderSection
                    width: parent.width
                    height: parent.height - bgHeader.height
                    anchors.top: bgHeader.bottom
                    color: parent.color
                    
                    Column {
                    anchors.fill: parent
                    spacing: 0
                    
                    Rectangle {
                        id: bgSliderRedSection
                        width: parent.width
                        height: bgSliderSection.height/3
                        color: "transparent"
                        
                        Rectangle {
                            id: bgColourRectRed
                            width: parent.width/12
                            height: parent.height/3
                            anchors.centerIn: parent
                            color: "#" + bgRedString + "0000"
                            border.color: Qt.darker(bgColourRectRed.color)
                            radius: 5
                        } //bgColourRectRed
                        
                        Slider {
                            id: bgSliderRed
                            width: parent.width/5 * 4
                            height: parent.height
                            anchors.horizontalCenter: parent.horizontalCenter
                            from: 0x00
                            to: 0xff
                            value: defaultBgRed
                            stepSize: 0x01
                            snapMode: Slider.SnapAlways
                            
                        } //bgSliderRed
                        
                    } //bgSliderRedSection
                    
                    Rectangle {
                        id: bgSliderGreenSection
                        width: parent.width
                        height: bgSliderSection.height/3
                        color: "transparent"
                        
                        Rectangle {
                            id: bgColourRectGreen
                            width: parent.width/12
                            height: parent.height/3
                            anchors.centerIn: parent
                            color: "#00" + bgGreenString + "00"
                            border.color: Qt.darker(bgColourRectGreen.color)
                            radius: 5
                        } //bgColourRectGreen
                        
                        Slider {
                            id: bgSliderGreen
                            width: parent.width/5 * 4
                            height: parent.height
                            anchors.horizontalCenter: parent.horizontalCenter
                            from: 0x00
                            to: 0xff
                            value: defaultBgGreen
                            stepSize: 0x01
                            snapMode: Slider.SnapAlways
                            
                        } //bgSliderGreen
                        
                        
                    } //bgSliderGreenSection
                    
                    Rectangle {
                        id: bgSliderBlueSection
                        width: parent.width
                        height: bgSliderSection.height/3
                        color: "transparent"
                        
                        Rectangle {
                            id: bgColourRectBlue
                            width: parent.width/12
                            height: parent.height/3
                            anchors.centerIn: parent
                            color: "#0000" + bgBlueString
                            border.color: Qt.darker(bgColourRectBlue.color)
                            radius: 5
                        } //bgColourRectBlue
                        
                        Slider {
                            id: bgSliderBlue
                            width: parent.width/5 * 4
                            height: parent.height
                            anchors.horizontalCenter: parent.horizontalCenter
                            from: 0x00
                            to: 0xff
                            value: defaultBgBlue
                            stepSize: 0x01
                            snapMode: Slider.SnapAlways
                                
                        } //bgSliderBlue
                        
                    } //bgSliderBlueSection
                    
                    } //Column
                
                } //bgSliderSection
                
            } //bgColourSection
            
            Rectangle {
                id: inkColourSection
                width: parent.width
                height: parent.height/2
                anchors.bottom: parent.bottom
                color: "transparent"
                
                Rectangle {
                    id: inkHeader
                    width: parent.width
                    height: settingsHeight
                    color: Qt.darker(backgroundColour)
                    anchors.top: parent.top
                    
                    Label {
                        id: inkHeaderLabel
                        text: i18n.tr("Text")
                        color: inkColour
                        anchors.centerIn: parent
                        font.pointSize: settingsFontSize
                    } //inkHeaderLabel    
                    
                } //inkHeader
                
                Rectangle {
                    id: inkSliderSection
                    width: parent.width
                    height: parent.height - inkHeader.height
                    anchors.top: inkHeader.bottom
                    color: parent.color
                
                    Column {
                        anchors.fill: parent
                        spacing: 0
                        
                        Rectangle {
                            id: inkSliderRedSection
                            width: parent.width
                            height: inkSliderSection.height/3
                            color: "transparent"
                            
                            Rectangle {
                                id: inkColourRectRed
                                width: parent.width/12
                                height: parent.height/3
                                anchors.centerIn: parent
                                color: "#" + inkRedString + "0000"
                                border.color: Qt.darker(inkColourRectRed.color)
                                radius: 5
                            } //inkColourRectRed
                            
                            Slider {
                                id: inkSliderRed
                                width: parent.width/5 * 4
                                height: parent.height
                                anchors.horizontalCenter: parent.horizontalCenter
                                from: 0x00
                                to: 0xff
                                value: defaultInkRed
                                stepSize: 0x01
                                snapMode: Slider.SnapAlways
                                
                            } //inkSliderRed
                            
                        } //inkSliderRedSection
                        
                        Rectangle {
                            id: inkSliderGreenSection
                            width: parent.width
                            height: inkSliderSection.height/3
                            color: "transparent"
                            
                            Rectangle {
                                id: inkColourRectGreen
                                width: parent.width/12
                                height: parent.height/3
                                anchors.centerIn: parent
                                color: "#00" + inkGreenString + "00"
                                border.color: Qt.darker(inkColourRectGreen.color)
                                radius: 5
                            } //inkColourRectGreen
                            
                            Slider {
                                id: inkSliderGreen
                                width: parent.width/5 * 4
                                height: parent.height
                                anchors.horizontalCenter: parent.horizontalCenter
                                from: 0x00
                                to: 0xff
                                value: defaultInkGreen
                                stepSize: 0x01
                                snapMode: Slider.SnapAlways
                                
                            } //inkSliderGreen
                            
                            
                        } //inkSliderGreenSection
                        
                        Rectangle {
                            id: inkSliderBlueSection
                            width: parent.width
                            height: inkSliderSection.height/3
                            color: "transparent"
                            
                            Rectangle {
                                id: inkColourRectBlue
                                width: parent.width/12
                                height: parent.height/3
                                anchors.centerIn: parent
                                color: "#0000" + inkBlueString
                                border.color: Qt.darker(inkColourRectBlue.color)
                                radius: 5
                            } //inkColourRectBlue
                            
                            Slider {
                                id: inkSliderBlue
                                width: parent.width/5 * 4
                                height: parent.height
                                anchors.horizontalCenter: parent.horizontalCenter
                                from: 0x00
                                to: 0xff
                                value: defaultInkBlue
                                stepSize: 0x01
                                snapMode: Slider.SnapAlways
                                
                            } //inkSliderBlue
                            
                        } //inkSliderBlueSection
                        
                    } //Column
                
                } //inkSliderSection
                
            } //inkColourSection
                
        } //page5
    
} //ApplicationWindow - theApplication
