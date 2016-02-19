import QtQuick 2.4

Item {
    id: root
    property real rollAngle:  0
    property real pitchAngle: 0
    clip:           true
    anchors.fill:   parent

    property real trans_y:      200
    property real angularScale: pitchAngle * (trans_y > 300 ? 4.1 : (trans_y * 10 / 23 * 0.15 + 1) /5)

    Item {
        id: artificialHorizon
        width:  root.width * 4
        height: root.height * 4
        anchors.centerIn: parent
        Rectangle {
            id: sky
            anchors.fill: parent
            smooth: true
            antialiasing: true
            gradient:   Gradient {
                GradientStop {position: 0.25; color: Qt.hsla(0.6, 1.0, 0.25)}
                GradientStop {position: 0.5;  color: Qt.hsla(0.6, 0.5, 0.55)}
            }
        }
        Rectangle {
            id: ground
            height: sky.height / 2
            anchors {
                left:   sky.left;
                right:  sky.right;
                bottom: sky.bottom
            }
            smooth: true
            antialiasing: true
            gradient:   Gradient {
                GradientStop {position: 0.0;  color: Qt.hsla(0.25, 0.5, 0.45)}
                GradientStop {position: 0.25; color: Qt.hsla(0.25, 0.75, 0.25)}
            }
        }
        transform: [
            Translate {
                y:   angularScale
            },
            Rotation {
                origin.x:   artificialHorizon.width / 2
                origin.y:   artificialHorizon.height / 2
                angle:      -rollAngle
            }
        ]
    }
}

