package cranedata

class Device {
    String  name
    String description
    String dnumber
    String flag
    static belongsTo = [scene:Scene]
    static hasMany = [channels:Channel]
    static constraints = {
        flag(nullable: true)
    }
}
