/* Webcamoid, webcam capture application.
 * Copyright (C) 2011-2014  Gonzalo Exequiel Pedone
 *
 * Webcamod is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamod is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamod. If not, see <http://www.gnu.org/licenses/>.
 *
 * Email     : hipersayan DOT x AT gmail DOT com
 * Web-Site 1: http://github.com/hipersayanX/Webcamoid
 * Web-Site 2: http://opendesktop.org/content/show.php/Webcamoid?content=144796
 */

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

ColumnLayout {
    id: configs
    property double stepSize: 0.01
    property double maxMultiplier: 10
    property double maxDisplacement: 255
    property double decimals: 2

    function updateKernel(index, value)
    {
        var kernel = ColorTransform.kernel
        kernel[index] = value
        ColorTransform.kernel = kernel
    }

    Label {
        text: qsTr("Transform matrix")
    }
    GridLayout {
        columns: 4

        // Red channel
        SpinBox {
            id: rr
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[0]

            onValueChanged: updateKernel(0, value)
        }
        SpinBox {
            id: rg
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[1]

            onValueChanged: updateKernel(1, value)
        }
        SpinBox {
            id: rb
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[2]

            onValueChanged: updateKernel(2, value)
        }
        SpinBox {
            id: r0
            stepSize: 1
            maximumValue: configs.maxDisplacement
            minimumValue: -configs.maxDisplacement
            decimals: 0
            value: ColorTransform.kernel[3]

            onValueChanged: updateKernel(3, value)
        }

        // Green channel
        SpinBox {
            id: gr
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[4]

            onValueChanged: updateKernel(4, value)
        }
        SpinBox {
            id: gg
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[5]

            onValueChanged: updateKernel(5, value)
        }
        SpinBox {
            id: gb
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[6]

            onValueChanged: updateKernel(6, value)
        }
        SpinBox {
            id: g0
            stepSize: 1
            maximumValue: configs.maxDisplacement
            minimumValue: -configs.maxDisplacement
            decimals: 0
            value: ColorTransform.kernel[7]

            onValueChanged: updateKernel(7, value)
        }

        // Blue channel
        SpinBox {
            id: br
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[8]

            onValueChanged: updateKernel(8, value)
        }
        SpinBox {
            id: bg
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[9]

            onValueChanged: updateKernel(9, value)
        }
        SpinBox {
            id: bb
            stepSize: configs.stepSize
            maximumValue: configs.maxMultiplier
            minimumValue: -configs.maxMultiplier
            decimals: configs.decimals
            value: ColorTransform.kernel[10]

            onValueChanged: updateKernel(10, value)
        }
        SpinBox {
            id: b0
            stepSize: 1
            maximumValue: configs.maxDisplacement
            minimumValue: -configs.maxDisplacement
            decimals: 0
            value: ColorTransform.kernel[11]

            onValueChanged: updateKernel(11, value)
        }
    }
}