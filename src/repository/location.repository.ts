import { Repository } from 'typeorm'
import { Location } from '../entities'
import { CustomRepository } from '../decorators'

@CustomRepository(Location)
export class LocationRepository extends Repository<Location> {}
