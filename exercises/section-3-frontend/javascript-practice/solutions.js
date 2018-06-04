
// Array.prototype.filter()
// 1. Filter the list of warehouses created prior to November 2013
export function problem1(warehouses) {
  return warehouses.filter(warehouse => {
    return Date.parse(warehouse.created_at) < Date.parse('2013-11-01')
  })
}

// Array.prototype.map()
// 2. Give us an array of all warehouses with their name and created date
// Each value should be in the following format: "Example, launched: YYYY/MM/DD"
// Hint: date will need adjustment to match the format
export function problem2(warehouses) {
  return warehouses.map(warehouse => {
    return `${warehouse.name}, launched: ${warehouse.created_at.split('-').join('/')}`
  })
}

// Array.prototype.sort()
// 3. Sort the warehouses by created_at, oldest to newest
export function problem3(warehouses) {
  return warehouses.sort((warehouseA, warehouseB) => {
    return Date.parse(warehouseA.created_at) - Date.parse(warehouseB.created_at)
  })
}


// Array.prototype.reduce()
// 4. What's the order total for all orders
export function problem4(orders) {
  return orders.reduce(((total, order) => {
    return total + order.total
  }), 0)
}

// 5. Sort the warehouses by days between created and launch_date
export function problem5(warehouses) {
  return warehouses.sort((warehouseA, warehouseB) => {
    return warehouseLaunchPeriod(warehouseA) - warehouseLaunchPeriod(warehouseB)
  })
}

function warehouseLaunchPeriod(warehouse) {
  if (!warehouse.launch_date) { return 0 }
  return Date.parse(warehouse.launch_date) - Date.parse(warehouse.created_at)
}

// 6. create a list of warehouses with the 'Organic' category
export function problem6(warehouses) {
  return warehouses.map(warehouse => {
    if (warehouse.categories.includes('Organic')) {
      return warehouse
    }
  }).filter(warehouse => !!warehouse)
}

// 7. sort Exercise
// Sort the order by user alphabetically by last name
export function problem7(orders) {
  return orders.sort((orderA, orderB) => {
    return parseLastName(orderA.user_name) > parseLastName(orderB.user_name)
  })
}

function parseLastName(userName) {
  return userName.toUpperCase().split(' ').pop()
}

// 8. Reduce Exercise
// Create a hash for counts of each first name
export function problem8(orders) {
  return orders.reduce((hash, order) => {
    const firstName = parseFirstName(order)
    if(!hash[firstName]) { hash[firstName] = 0 }
    hash[firstName]++
    return hash
  }, {})
}

function parseFirstName(order) {
  return order.user_name.split(' ')[0]
}
