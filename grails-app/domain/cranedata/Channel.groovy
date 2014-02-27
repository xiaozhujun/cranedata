package cranedata

class Channel {
    String name
    String flag
    static belongsTo = [device:Device]
    static hasMany = [sensors:Sensor]
    static constraints = {
        flag(nullable: true)
    }
}
