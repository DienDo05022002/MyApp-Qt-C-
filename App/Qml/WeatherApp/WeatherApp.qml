import QtQuick 2.7
import QtQuick.Window 2.2

import Weather 1.0
import "components"

Item {
    visible: true
    width: 768
    height: 538
    //:::start

    Item {
        id: window
        width: parent.width; height: parent.height

                state: "loading"
                states: [
                    State {
                        name: "loading"
                        PropertyChanges { target: mainApp; opacity: 0 }
                        PropertyChanges { target: wait; opacity: 1 }
                    },
                    State {
                        name: "ready"
                        PropertyChanges { target: mainApp; opacity: 1 }
                        PropertyChanges { target: wait; opacity: 0 }
                    }
                ]
        //! [1]
        AppModel {
            id: model
            onReadyChanged: {
                                if(model.ready) {
                                    window.state = "ready"
                                } else {
                                    window.state = "loading"
                                }
            }
        }
        //! [1]
                Item {
                    id: wait
                    anchors.fill: parent

                    Text {
                        text: "Loading data....  Plaese wait:))"
                        anchors.centerIn: parent
                        font.family: "Arial"; font.pointSize: 18
                    }
                }
        Item {
            id: mainApp
            anchors.fill: parent

            Rectangle {
                anchors {
                    fill: parent
                }
                Rectangle {
                    id: headerTitle
                    width: parent.width
                    height: 50
                    color: "lightgrey"

                    Text {
                        id: nameCity
                        text: (model.hasValidCity ? model.city : "Unknown location") + (model.useGps ? " (GPS)" : "")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Hoi An"
                            } else {
                                switch (model.city) {
                                case "Hoi An":
                                    model.city = "Ho Chi Minh City"
                                    break
                                case "Ho Chi Minh City":
                                    model.city = "Hanoi"
                                    break
                                case "Hanoi":
                                    model.city = "Turan"
                                    break
                                case "Turan":
                                    model.useGps = true
                                    break
                                }
                            }
                        }
                    }
                }

                //! [3]
                Image {
                    source: "qrc:/App/Qml/WeatherApp/icons/wallpaper-weather.jpg"
                    anchors.top:  headerTitle.bottom
                    width: parent.width
                    height: parent.height - headerTitle.height

                    DateTime {
                        id: datetime
                        anchors {
                            topMargin: 6; bottomMargin: 6; rightMargin: 6; leftMargin: 6
                        }
                    }
                    Text {
                        id: textHeader
                        text: "Today's Weather Forecast"
                        color: "white"
                        font.pointSize: 20
                        anchors {
                            top: datetime.bottom
                            topMargin: 17; rightMargin: 13; leftMargin: 13
                        }
                    }
                    BigForecastIcon {
                        id: current
                        x: 0
                        width: mainApp.width -12
                        height: 2 * (mainApp.height - 25 - 12) / 3.8
                        anchors.topMargin: 0
                        anchors.top: textHeader.bottom

                        weatherIcon: (model.hasValidWeather ? model.weather.weatherIcon : "01d")
                        //! [3]
                        topText: (model.hasValidWeather ? model.weather.temperature : "??")
                        bottomText: (model.hasValidWeather ? model.weather.weatherDescription : "No weather data")
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                model.refreshWeather()
                            }
                        }
                        //! [4]
                    }
                    //! [4]
                    Row {
                        id: iconRow
                        spacing: 6
                        anchors.top: current.bottom
                        anchors.bottomMargin: 10
                        width: mainApp.width -12
                        height:  (mainApp.height - 25 - 24) / 3

                        property real iconWidth: iconRow.width / 4 - 10
                        property real iconHeight: iconRow.height

                        ForecastIcon {
                            id: forecast1
                            width: iconRow.iconWidth
                            height: iconRow.iconHeight

                            topText: (model.hasValidWeather ? model.forecast[0].dayOfWeek : "??")
                            bottomText: (model.hasValidWeather ? model.forecast[0].temperature : "??/??")
                            weatherIcon: (model.hasValidWeather ? model.forecast[0].weatherIcon : "01d")
                        }
                        ForecastIcon {
                            id: forecast2
                            width: iconRow.iconWidth
                            height: iconRow.iconHeight

                            topText: (model.hasValidWeather ?
                                          model.forecast[1].dayOfWeek : "??")
                            bottomText: (model.hasValidWeather ?
                                             model.forecast[1].temperature : "??/??")
                            weatherIcon: (model.hasValidWeather ?
                                              model.forecast[1].weatherIcon : "01d")
                        }
                        ForecastIcon {
                            id: forecast3
                            width: iconRow.iconWidth
                            height: iconRow.iconHeight

                            topText: (model.hasValidWeather ?
                                          model.forecast[2].dayOfWeek : "??")
                            bottomText: (model.hasValidWeather ?
                                             model.forecast[2].temperature : "??/??")
                            weatherIcon: (model.hasValidWeather ?
                                              model.forecast[2].weatherIcon : "01d")
                        }
                        ForecastIcon {
                            id: forecast4
                            width: iconRow.iconWidth
                            height: iconRow.iconHeight

                            topText: (model.hasValidWeather ?
                                          model.forecast[3].dayOfWeek : "??")
                            bottomText: (model.hasValidWeather ?
                                             model.forecast[3].temperature : "??/??")
                            weatherIcon: (model.hasValidWeather ?
                                              model.forecast[3].weatherIcon : "01d")
                        }

                    }
                }
            }
        }
        //:::>>>
    }
    // :::End
}




























