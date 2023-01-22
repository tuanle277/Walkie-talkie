import { Repository } from 'typeorm'
import { User } from '../entities'
import { CustomRepository } from '../decorators'

@CustomRepository(User)
export class UserRepository extends Repository<User> {}
