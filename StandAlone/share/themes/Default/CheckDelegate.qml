/* Webcamoid, webcam capture application.
 * Copyright (C) 2019  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://webcamoid.github.io/
 */

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Templates 2.5 as T
import QtGraphicalEffects 1.0
import QtQuick.Controls.impl 2.12
import Ak 1.0

T.CheckDelegate {
    id: control
    icon.width: AkUnit.create(18 * ThemeSettings.controlScale, "dp").pixels
    icon.height: AkUnit.create(18 * ThemeSettings.controlScale, "dp").pixels
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + implicitIndicatorWidth
                            + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    padding: AkUnit.create(4 * ThemeSettings.controlScale, "dp").pixels
    spacing: AkUnit.create(8 * ThemeSettings.controlScale, "dp").pixels
    hoverEnabled: true
    clip: true

    readonly property int animationTime: 200

    indicator: Item {
        id: checkBoxIndicator
        anchors.right: control.right
        anchors.rightMargin: control.rightPadding
        anchors.verticalCenter: control.verticalCenter
        implicitWidth:
            AkUnit.create(24 * ThemeSettings.controlScale, "dp").pixels
        implicitHeight:
            AkUnit.create(24 * ThemeSettings.controlScale, "dp").pixels

        Rectangle {
            id: indicatorRect
            border.width:
                control.checkState == Qt.Unchecked
                || control.highlighted?
                    AkUnit.create(2 * ThemeSettings.controlScale, "dp").pixels:
                    0
            border.color:
                control.highlighted?
                    checkOverlay.color:
                control.checkState == Qt.Unchecked?
                    ThemeSettings.shade(ThemeSettings.colorBack, -0.5):
                    "transparent"
            color: control.checkState == Qt.Unchecked
                   || control.highlighted?
                       "transparent":
                       ThemeSettings.colorPrimary
            radius: AkUnit.create(4 * ThemeSettings.controlScale, "dp").pixels
            anchors.verticalCenter: checkBoxIndicator.verticalCenter
            anchors.horizontalCenter: checkBoxIndicator.horizontalCenter
            width: Math.min(checkBoxIndicator.width, checkBoxIndicator.height)
            height: width
        }
        Image {
            id: checkImage
            asynchronous: true
            cache: true
            source: control.checkState == Qt.Checked?
                        "image://icons/check":
                        "image://icons/minus"
            sourceSize: Qt.size(width, height)
            anchors.fill: indicatorRect
            visible: false
        }
        ColorOverlay {
            id: checkOverlay
            anchors.fill: checkImage
            source: checkImage
            color: ThemeSettings.contrast(ThemeSettings.colorPrimary, 0.75)
            visible: control.checkState != Qt.Unchecked
        }
    }

    contentItem: IconLabel {
        id: iconLabel
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon.name: control.icon.name
        icon.source: control.icon.source
        icon.width: control.icon.width
        icon.height: control.icon.height
        icon.color:
            control.highlighted?
                ThemeSettings.contrast(ThemeSettings.colorPrimary, 0.75):
                ThemeSettings.colorText
        text: control.text
        font: control.font
        color: control.highlighted?
                   ThemeSettings.contrast(ThemeSettings.colorPrimary, 0.75):
                   ThemeSettings.colorText
        alignment: Qt.AlignLeft
        anchors.leftMargin: control.leftPadding
        anchors.left: control.left
        anchors.right: checkBoxIndicator.left
    }

    background: Rectangle {
        id: background
        implicitWidth:
            AkUnit.create(128 * ThemeSettings.controlScale, "dp").pixels
        implicitHeight:
            AkUnit.create(48 * ThemeSettings.controlScale, "dp").pixels
        color: control.highlighted?
                   ThemeSettings.colorPrimary:
                   ThemeSettings.shade(ThemeSettings.colorBack, -0.1, 0)
    }

    states: [
        State {
            name: "Disabled"
            when: !control.enabled

            PropertyChanges {
                target: indicatorRect
                border.color:
                    control.checkState == Qt.Unchecked?
                        ThemeSettings.shade(ThemeSettings.colorBack, -0.1):
                        "transparent"
                color: control.checkState == Qt.Unchecked?
                           "transparent":
                           ThemeSettings.shade(ThemeSettings.colorBack, -0.1)
            }
            PropertyChanges {
                target: checkOverlay
                color: ThemeSettings.shade(ThemeSettings.colorBack, -0.3)
            }
            PropertyChanges {
                target: iconLabel
                icon.color: ThemeSettings.shade(ThemeSettings.colorBack, -0.1)
                color: ThemeSettings.shade(ThemeSettings.colorBack, -0.1)
            }
            PropertyChanges {
                target: background
                color: ThemeSettings.shade(ThemeSettings.colorBack, -0.1, 0)
            }
        },
        State {
            name: "Hovered"
            when: (control.hovered
                   || control.visualFocus
                   || control.activeFocus)
                  && !control.pressed

            PropertyChanges {
                target: indicatorRect
                border.color:
                    control.highlighted?
                        checkOverlay.color:
                    control.checkState == Qt.Unchecked?
                        ThemeSettings.shade(ThemeSettings.colorBack, -0.6):
                        "transparent"
                color: control.checkState == Qt.Unchecked
                       || control.highlighted?
                           "transparent":
                           ThemeSettings.constShade(ThemeSettings.colorPrimary,
                                                    0.1)
            }
            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorPrimary,
                                                 0.1):
                        ThemeSettings.shade(ThemeSettings.colorBack, -0.1)
            }
        },
        State {
            name: "Pressed"
            when: control.pressed

            PropertyChanges {
                target: indicatorRect
                border.color:
                    control.highlighted?
                        checkOverlay.color:
                    control.checkState == Qt.Unchecked?
                        ThemeSettings.shade(ThemeSettings.colorBack, -0.7):
                        "transparent"
                color: control.checkState == Qt.Unchecked
                       || control.highlighted?
                           "transparent":
                           ThemeSettings.constShade(ThemeSettings.colorPrimary,
                                                    0.3)
            }
            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorPrimary,
                                                 0.2):
                        ThemeSettings.shade(ThemeSettings.colorBack, -0.2)
            }
        }
    ]

    transitions: Transition {
        ColorAnimation {
            target: indicatorRect
            duration: control.animationTime
        }
        ColorAnimation {
            target: checkOverlay
            duration: control.animationTime
        }
        ColorAnimation {
            target: iconLabel
            duration: control.animationTime
        }
        ColorAnimation {
            target: background
            duration: control.animationTime
        }
    }
}
