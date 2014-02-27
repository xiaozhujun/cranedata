package cranedata

class Scene {
    String name
    String description
    String address
    static hasMany = [devices:Device]
    static constraints = {
    }
}
