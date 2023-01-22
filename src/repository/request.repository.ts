import { Repository } from 'typeorm'
import { Request } from '../entities'
import { CustomRepository } from '../decorators'

@CustomRepository(Request)
export class RequestRepository extends Repository<Request> {}
