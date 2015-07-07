package taller.facturaDetalle

import org.springframework.dao.DataIntegrityViolationException

class FacturaDetalleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [facturaDetalleInstanceList: FacturaDetalle.list(params), facturaDetalleInstanceTotal: FacturaDetalle.count()]
    }

    def create() {
        [facturaDetalleInstance: new FacturaDetalle(params)]
    }

    def save() {
        def facturaDetalleInstance = new FacturaDetalle(params)
        if (!facturaDetalleInstance.save(flush: true)) {
            render(view: "create", model: [facturaDetalleInstance: facturaDetalleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), facturaDetalleInstance.id])
        redirect(action: "show", id: facturaDetalleInstance.id)
    }

    def show(Long id) {
        def facturaDetalleInstance = FacturaDetalle.get(id)
        if (!facturaDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "list")
            return
        }

        [facturaDetalleInstance: facturaDetalleInstance]
    }

    def edit(Long id) {
        def facturaDetalleInstance = FacturaDetalle.get(id)
        if (!facturaDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "list")
            return
        }

        [facturaDetalleInstance: facturaDetalleInstance]
    }

    def update(Long id, Long version) {
        def facturaDetalleInstance = FacturaDetalle.get(id)
        if (!facturaDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facturaDetalleInstance.version > version) {
                facturaDetalleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'facturaDetalle.label', default: 'FacturaDetalle')] as Object[],
                          "Another user has updated this FacturaDetalle while you were editing")
                render(view: "edit", model: [facturaDetalleInstance: facturaDetalleInstance])
                return
            }
        }

        facturaDetalleInstance.properties = params

        if (!facturaDetalleInstance.save(flush: true)) {
            render(view: "edit", model: [facturaDetalleInstance: facturaDetalleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), facturaDetalleInstance.id])
        redirect(action: "show", id: facturaDetalleInstance.id)
    }

    def delete(Long id) {
        def facturaDetalleInstance = FacturaDetalle.get(id)
        if (!facturaDetalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "list")
            return
        }

        try {
            facturaDetalleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle'), id])
            redirect(action: "show", id: id)
        }
    }
}
