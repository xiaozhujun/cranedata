package cranedata

import org.apache.ivy.core.check.CheckEngine

class Sensor {
    String name
    String description
    static belongsTo = [channel:Channel]
    static constraints = {
    }
}
