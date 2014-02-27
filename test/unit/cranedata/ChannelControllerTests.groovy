package cranedata



import org.junit.*
import grails.test.mixin.*

@TestFor(ChannelController)
@Mock(Channel)
class ChannelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/channel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.channelInstanceList.size() == 0
        assert model.channelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.channelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.channelInstance != null
        assert view == '/channel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/channel/show/1'
        assert controller.flash.message != null
        assert Channel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/channel/list'

        populateValidParams(params)
        def channel = new Channel(params)

        assert channel.save() != null

        params.id = channel.id

        def model = controller.show()

        assert model.channelInstance == channel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/channel/list'

        populateValidParams(params)
        def channel = new Channel(params)

        assert channel.save() != null

        params.id = channel.id

        def model = controller.edit()

        assert model.channelInstance == channel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/channel/list'

        response.reset()

        populateValidParams(params)
        def channel = new Channel(params)

        assert channel.save() != null

        // test invalid parameters in update
        params.id = channel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/channel/edit"
        assert model.channelInstance != null

        channel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/channel/show/$channel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        channel.clearErrors()

        populateValidParams(params)
        params.id = channel.id
        params.version = -1
        controller.update()

        assert view == "/channel/edit"
        assert model.channelInstance != null
        assert model.channelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/channel/list'

        response.reset()

        populateValidParams(params)
        def channel = new Channel(params)

        assert channel.save() != null
        assert Channel.count() == 1

        params.id = channel.id

        controller.delete()

        assert Channel.count() == 0
        assert Channel.get(channel.id) == null
        assert response.redirectedUrl == '/channel/list'
    }
}
