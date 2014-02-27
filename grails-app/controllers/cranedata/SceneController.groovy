package cranedata

import org.springframework.dao.DataIntegrityViolationException

class SceneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sceneInstanceList: Scene.list(params), sceneInstanceTotal: Scene.count()]
    }

    def create() {
        [sceneInstance: new Scene(params)]
    }

    def save() {
        def sceneInstance = new Scene(params)
        if (!sceneInstance.save(flush: true)) {
            render(view: "create", model: [sceneInstance: sceneInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'scene.label', default: 'Scene'), sceneInstance.id])
        redirect(action: "show", id: sceneInstance.id)
    }

    def show(Long id) {
        def sceneInstance = Scene.get(id)
        if (!sceneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
            return
        }

        [sceneInstance: sceneInstance]
    }
    def showfront(Long id){
        def sceneInstance = Scene.get(id)
        if (!sceneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
            return
        }

        render(view: "showfront",model: [sceneInstance: sceneInstance])
    }
    def edit(Long id) {
        def sceneInstance = Scene.get(id)
        if (!sceneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
            return
        }

        [sceneInstance: sceneInstance]
    }

    def update(Long id, Long version) {
        def sceneInstance = Scene.get(id)
        if (!sceneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sceneInstance.version > version) {
                sceneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'scene.label', default: 'Scene')] as Object[],
                        "Another user has updated this Scene while you were editing")
                render(view: "edit", model: [sceneInstance: sceneInstance])
                return
            }
        }

        sceneInstance.properties = params

        if (!sceneInstance.save(flush: true)) {
            render(view: "edit", model: [sceneInstance: sceneInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'scene.label', default: 'Scene'), sceneInstance.id])
        redirect(action: "show", id: sceneInstance.id)
    }

    def delete(Long id) {
        def sceneInstance = Scene.get(id)
        if (!sceneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
            return
        }

        try {
            sceneInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scene.label', default: 'Scene'), id])
            redirect(action: "show", id: id)
        }
    }
    String result
    int leftPadding
    int i
    def getFront(){
        System.out.println("hah")
        result = ""
        leftPadding = 0
        System.out.println("---------")
        List<Integer> ids=Scene.executeQuery("select id from Scene")
        Iterator it=ids.iterator()
        while(it.hasNext()){
            int i=(int)it.next()
            Scene root = Scene.get(i)
            System.out.println("---------")
            getAllToFront(root)
        }
        render result as String
    }
    //在前端展示的情况
    private void getAllToFront(obj){
        /* if (obj instanceof Device) {
             System.out.println("1")
             result += '<div class="bullet" url="/cranedata/device/showfront/'+ obj.id +'">'+ obj.name +'</div>'
         } else if (obj instanceof Scene) {
             System.out.println("2")
             result +=
                 '<div class="treeItem">' +
                         '<div class="itemTitle titleShow">' +
                         '<div class="bullet" url="/cranedata/scene/showfront/'+ obj.id +'">'+ obj.name +'</div>' +
                         '</div>' +
                         '<div class="itemContent contentShow">'
             *//*if (obj.children) {
                 for (Scene child in obj.children) {
                     leftPadding++
                     getAllToFront(child)
                     leftPadding--
                 }
             }*//*
             //获取与现场有关的设备
             if (obj.devices) {
                 for (Device device in obj.devices) {
                     leftPadding++
                     getAllToFront(device)
                     leftPadding--
                 }
             }
             result += '</div>' +
                     '</div>'
         }*/
        if(obj instanceof Sensor){
            result += '<div class="bullet" url="/cranedata/sensor/showfront/'+ obj.id +'">'+ obj.name +'</div>'
        }else if(obj instanceof Channel){
            result +=
                '<div class="treeItem">' +
                        '<div class="itemTitle titleShow">' +
                        '<div class="bullet" url="/cranedata/channel/showfront/'+ obj.id +'">'+ obj.name +'</div>' +
                        '</div>' +
                        '<div class="itemContent contentShow">'
            if (obj.sensors) {
                for (Sensor senspr in obj.sensors) {
                    leftPadding++
                    getAllToFront(senspr)
                    leftPadding--
                }
            }
            result += '</div>' +
                    '</div>'
        }else if(obj instanceof Device){
            result +=
                '<div class="treeItem">' +
                        '<div class="itemTitle titleShow">' +
                        '<div class="bullet" url="/cranedata/device/showfront/'+ obj.id +'">'+ obj.name +'</div>' +
                        '</div>' +
                        '<div class="itemContent contentShow">'
            if (obj.channels) {
                for (Channel channel in obj.channels) {
                    leftPadding++
                    getAllToFront(channel)
                    leftPadding--
                }
            }
            result += '</div>' +
                    '</div>'
        }else if(obj instanceof Scene){
            result +=
                '<div class="treeItem">' +
                        '<div class="itemTitle titleShow">' +
                        '<div class="bullet" url="/cranedata/scene/showfront/'+ obj.id +'">'+ obj.name +'</div>' +
                        '</div>' +
                        '<div class="itemContent contentShow">'
            if (obj.devices){
                for (Device device in obj.devices) {
                    leftPadding++
                    getAllToFront(device)
                    leftPadding--
                }
            }
            result += '</div>' +
                    '</div>'
        }



    }
}
