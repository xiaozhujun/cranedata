package cranedata

import org.springframework.dao.DataIntegrityViolationException

class DeviceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deviceInstanceList: Device.list(params), deviceInstanceTotal: Device.count()]
    }

    def create() {
        [deviceInstance: new Device(params)]
    }

    def save() {
        def deviceInstance = new Device(params)
        if (!deviceInstance.save(flush: true)) {
            render(view: "create", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "show", id: deviceInstance.id)
    }

    def show(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        [deviceInstance: deviceInstance]
    }
    def showfront(Long id) {
        //通过这个id号查出与之关联的通道，再通过通道号查出相关的每个通道的连接状况
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }
        def d=Device.findAllById(id)
        System.out.println(d+">>>>")
        List flist=new  ArrayList()
        List<Long> ids=Channel.executeQuery("select c.id from Channel c where c.device=?",[deviceInstance])
        Iterator it=ids.iterator()
        while(it.hasNext()){
            Channel c=new Channel()
            Long x=(Long)it.next()
            System.out.println(x)
            c.setProperty("id",x)
            String name=Channel.executeQuery("select name from Channel c where c.id=?",[x])
            c.setProperty("name",name)
            String flag=Channel.executeQuery("select flag from Channel c where c.id=?",[x])
            c.setProperty("flag",flag)
            flist.add(c)
        }
        Iterator i=flist.iterator()
        while(i.hasNext()){
            Channel c=(Channel)i.next()
            System.out.println(c.getProperty("id")+"???")
            System.out.println(c.getProperty("name"))
            System.out.println(c.getProperty("flag"))
        }
        render(view:"showfront",model:[deviceInstance:deviceInstance,flist: flist])
    }

    def edit(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        [deviceInstance: deviceInstance]
    }

    def update(Long id, Long version) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deviceInstance.version > version) {
                deviceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'device.label', default: 'Device')] as Object[],
                          "Another user has updated this Device while you were editing")
                render(view: "edit", model: [deviceInstance: deviceInstance])
                return
            }
        }

        deviceInstance.properties = params

        if (!deviceInstance.save(flush: true)) {
            render(view: "edit", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "show", id: deviceInstance.id)
    }

    def delete(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        try {
            deviceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "show", id: id)
        }
    }
}
