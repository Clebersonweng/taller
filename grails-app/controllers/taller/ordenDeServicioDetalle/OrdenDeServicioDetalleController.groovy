package taller.ordenDeServicioDetalle

import org.springframework.dao.DataIntegrityViolationException

class OrdenDeServicioDetalleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ordenDeServicioDetalleInstanceList: OrdenDeServicioDetalle.list(params), ordenDeServicioDetalleInstanceTotal: OrdenDeServicioDetalle.count()]
    }

    def create() {
        [ordenDeServicioDetalleInstance: new OrdenDeServicioDetalle(params)]
    }

    def save() {
        def ordenDeServicioDetalleInstance = new OrdenDeServicioDetalle(params)
        if (!ordenDeServicioDetalleInstance.save(flush: true)) {
            render(view: "create", model: [ordenDeServicioDetalleInstance: ordenDeServicioDetalleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), ordenDeServicioDetalleInstance.id])
        redirect(action: "show", id: ordenDeServicioDetalleInstance.id)
    }

    def show(Long id) {
        def ordenDeServicioDetalleInstance = OrdenDeServicioDetalle.get(id)
        if (!ordenDeServicioDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "list")
            return
        }

        [ordenDeServicioDetalleInstance: ordenDeServicioDetalleInstance]
    }

    def edit(Long id) {
        def ordenDeServicioDetalleInstance = OrdenDeServicioDetalle.get(id)
        if (!ordenDeServicioDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "list")
            return
        }

        [ordenDeServicioDetalleInstance: ordenDeServicioDetalleInstance]
    }

    def update(Long id, Long version) {
        def ordenDeServicioDetalleInstance = OrdenDeServicioDetalle.get(id)
        if (!ordenDeServicioDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ordenDeServicioDetalleInstance.version > version) {
                ordenDeServicioDetalleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle')] as Object[],
                          "Another user has updated this OrdenDeServicioDetalle while you were editing")
                render(view: "edit", model: [ordenDeServicioDetalleInstance: ordenDeServicioDetalleInstance])
                return
            }
        }

        ordenDeServicioDetalleInstance.properties = params

        if (!ordenDeServicioDetalleInstance.save(flush: true)) {
            render(view: "edit", model: [ordenDeServicioDetalleInstance: ordenDeServicioDetalleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), ordenDeServicioDetalleInstance.id])
        redirect(action: "show", id: ordenDeServicioDetalleInstance.id)
    }

    def delete(Long id) {
        def ordenDeServicioDetalleInstance = OrdenDeServicioDetalle.get(id)
        if (!ordenDeServicioDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "list")
            return
        }

        try {
            ordenDeServicioDetalleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle'), id])
            redirect(action: "show", id: id)
        }
    }
}
