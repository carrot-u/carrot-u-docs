import {expect} from 'chai'
import * as solutions from '../solutions'
import * as answers from '../startHere'
import { orders, warehouses } from '../data'

describe('Problem 1', () => {
  it('Filters all warehouses and returns those created prior to November 2013', () => {
    expect(answers.problem1(warehouses)).to.deep.equal(solutions.problem1(warehouses))
  })
})

describe('Problem 2', () => {
  it('Returns an array of warehouses in the "Example, launched: YYYY/MM/DD" format', () => {
    expect(answers.problem2(warehouses)).to.deep.equal(solutions.problem2(warehouses))
  })
})

describe('Problem 3', () => {
  it('Sorts warehouses by created_at, oldest to newest', () => {
    expect(answers.problem3(orders)).to.deep.equal(solutions.problem3(orders))
  })
})

describe('Problem 4', () => {
  it('Returns the order total for all orders', () => {
    expect(answers.problem4(orders)).to.equal(solutions.problem4(orders))
  })
})

describe('Problem 5', () => {
  it('Return warehouses sorted by days between created and launch_date', () => {
    expect(answers.problem5(warehouses)).to.deep.equal(solutions.problem5(warehouses))
  })
})

describe('Problem 6', () => {
  it('Returns a list of warehouses with the "Organic" category', () => {
    expect(answers.problem6(warehouses)).to.deep.equal(solutions.problem6(warehouses))
  })
})

describe('Problem 7', () => {
  it('Returns array of orders sorted by user alphabetically by last name', () => {
    expect(answers.problem7(orders)).to.deep.equal(solutions.problem7(orders))
  })
})

describe('Problem 8', () => {
  it('Returns a hash of order counts of each first name', () => {
    expect(answers.problem8(orders)).to.deep.equal(solutions.problem8(orders))
  })
})

