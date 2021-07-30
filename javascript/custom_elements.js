import CableReady from "cable_ready"

const camelize = str =>
  str.replace(/[-_](.)/g, (_, group1) => {
    return group1.toUpperCase()
  })

export class CableCarOperationElement extends HTMLElement {
  connectedCallback() {
    const operationOptions = {}
    Array.from(this.attributes).forEach(attr => {
      if (attr.name != 'operation') {
        operationOptions[camelize(attr.name)] = JSON.parse(attr.value)
      }
    })

    const operation = {
      [camelize(this.getAttribute("operation"))]: [operationOptions]
    }

    CableReady.perform(operation)

    this.remove()
  }
}
customElements.define("cr-op", CableCarOperationElement)

export default CableCarOperationElement
