pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    readonly property QtObject colors: QtObject {
        readonly property color background: "{{background}}";
        readonly property color secondaryBackground: "{{color9}}";
        readonly property color hoverSecondaryBackground: "{{color1 | darken(0.3)}}";
        readonly property color foreground: "{{foreground}}";
        readonly property color hoverForeground: "{{color8}}";
        readonly property color secondaryForeground: "{{color15 | saturate(0.5) | darken(0.25)}}";
        readonly property color hoverSecondaryForeground: "{{color15 | saturate(0.5) | darken(0.5)}}";
    }
}
