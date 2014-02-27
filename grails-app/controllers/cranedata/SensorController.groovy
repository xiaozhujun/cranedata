package cranedata

import org.springframework.dao.DataIntegrityViolationException

class SensorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sensorInstanceList: Sensor.list(params), sensorInstanceTotal: Sensor.count()]
    }

    def create() {
        [sensorInstance: new Sensor(params)]
    }

    def save() {
        def sensorInstance = new Sensor(params)
        if (!sensorInstance.save(flush: true)) {
            render(view: "create", model: [sensorInstance: sensorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sensor.label', default: 'Sensor'), sensorInstance.id])
        redirect(action: "show", id: sensorInstance.id)
    }

    def show(Long id) {
        def sensorInstance = Sensor.get(id)
        if (!sensorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "list")
            return
        }

        [sensorInstance: sensorInstance]
    }

    def edit(Long id) {
        def sensorInstance = Sensor.get(id)
        if (!sensorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "list")
            return
        }

        [sensorInstance: sensorInstance]
    }

    def update(Long id, Long version) {
        def sensorInstance = Sensor.get(id)
        if (!sensorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sensorInstance.version > version) {
                sensorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sensor.label', default: 'Sensor')] as Object[],
                          "Another user has updated this Sensor while you were editing")
                render(view: "edit", model: [sensorInstance: sensorInstance])
                return
            }
        }

        sensorInstance.properties = params

        if (!sensorInstance.save(flush: true)) {
            render(view: "edit", model: [sensorInstance: sensorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sensor.label', default: 'Sensor'), sensorInstance.id])
        redirect(action: "show", id: sensorInstance.id)
    }

    def delete(Long id) {
        def sensorInstance = Sensor.get(id)
        if (!sensorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "list")
            return
        }

        try {
            sensorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sensor.label', default: 'Sensor'), id])
            redirect(action: "show", id: id)
        }
    }
}
