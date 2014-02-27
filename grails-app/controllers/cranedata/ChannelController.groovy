package cranedata

import org.springframework.dao.DataIntegrityViolationException

class ChannelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [channelInstanceList: Channel.list(params), channelInstanceTotal: Channel.count()]
    }

    def create() {
        [channelInstance: new Channel(params)]
    }

    def save() {
        def channelInstance = new Channel(params)
        if (!channelInstance.save(flush: true)) {
            render(view: "create", model: [channelInstance: channelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'channel.label', default: 'Channel'), channelInstance.id])
        redirect(action: "show", id: channelInstance.id)
    }

    def show(Long id) {
        def channelInstance = Channel.get(id)
        if (!channelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "list")
            return
        }

        [channelInstance: channelInstance]
    }

    def edit(Long id) {
        def channelInstance = Channel.get(id)
        if (!channelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "list")
            return
        }

        [channelInstance: channelInstance]
    }

    def update(Long id, Long version) {
        def channelInstance = Channel.get(id)
        if (!channelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (channelInstance.version > version) {
                channelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'channel.label', default: 'Channel')] as Object[],
                          "Another user has updated this Channel while you were editing")
                render(view: "edit", model: [channelInstance: channelInstance])
                return
            }
        }

        channelInstance.properties = params

        if (!channelInstance.save(flush: true)) {
            render(view: "edit", model: [channelInstance: channelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'channel.label', default: 'Channel'), channelInstance.id])
        redirect(action: "show", id: channelInstance.id)
    }

    def delete(Long id) {
        def channelInstance = Channel.get(id)
        if (!channelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "list")
            return
        }

        try {
            channelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'channel.label', default: 'Channel'), id])
            redirect(action: "show", id: id)
        }
    }
    String result=""
    def getChannel(){
        PrintWriter out=response.getWriter()
        Long id=Long.parseLong(request.getParameter("id"))
        def channelInstance = Channel.get(id)
        List<Long> ids=Sensor.executeQuery("select s.id from Sensor s where s.channel=?",[channelInstance])
        Iterator it=ids.iterator()
        while(it.hasNext()){
            Sensor s=new Sensor()
            Long x=(Long)it.next()
            String name=Sensor.executeQuery("select name from Sensor s where s.id=?",[x])
            s.setProperty("name",name)
            result="<div class='bodyitem'><span class='titleitem'><span class='itemfont'>"+s.getProperty("name")+"</span></span>"+
                    "<span class='titleitem'><span class='btn'>采集数据</span></span><span class='titleitem'><span class='btnbu'>停止</span></span>"+
                    "</div>"
            render result as String
           /* out.println("<div class='bodyitem'>")
            out.println("<span class='titleitem'><span class='itemfont'>"+s.getProperty("name")+"</span></span>");
            out.println("<span class='titleitem'><span class='btn1'>采集数据</span></span>");
            out.println("<span class='titleitem'><span class='btnbu'>停止</span></span>");
            out.println("</div>")*/
        }
    }
}
