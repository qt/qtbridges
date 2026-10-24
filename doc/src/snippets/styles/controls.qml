// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 320
    height: 240
    minimumWidth: 280
    minimumHeight: 220
    visible: true
    title: qsTr("Styles")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        RowLayout {
            RadioButton { text: qsTr("One"); checked: true }
            RadioButton { text: qsTr("Two") }
        }
        CheckBox { text: qsTr("Enable feature"); checked: true }
        Slider {
            Layout.fillWidth: true
            value: 0.5
        }
        Button {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Apply")
        }
        Item { Layout.fillHeight: true }
    }
}
