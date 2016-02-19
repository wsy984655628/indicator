import QtQuick 2.4
import QtQuick.Window 2.0

Window{
    id: root
    visible: true
    property real _defaultRoll: 0
    property real _defaultPitch: 0
    property real _defaultHeading: 0

    property real _roll: _defaultRoll
    property real _pitch: _defaultPitch
    property real _heading: _defaultHeading

    property real indwidth: 230
    property real indheight: 400

    width: 500
    height: 400
    ArtificialHorizon {
        id:         artificialHorizon
        trans_y:    indwidth
        rollAngle:  _roll
        pitchAngle: _pitch

    }

    AttitudeIndicator{
        id:         attitudeIndicator
        width:      indwidth
        height:     indheight
        rollAngle:  _roll
        pitchAngle: _pitch
    }
}
