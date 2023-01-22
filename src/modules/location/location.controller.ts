import { Body, Controller, Post } from '@nestjs/common'
import { CurrentUser } from 'src/decorators'
import { UserDto } from '../../dto'
import { LocationUpdateDto } from './dto'
import { LocationService } from './location.service'

@Controller('location')
export class LocationController {
  constructor(private readonly locationService: LocationService) {}

  @Post('update_data')
  public async updateData(@CurrentUser() user: UserDto, @Body() data: LocationUpdateDto) {
    return await this.locationService.updateData(user, data)
  }

  @Post('find')
  public async find(@CurrentUser() user: UserDto,  @Body() data : {id?: string} ) {
    return await this.locationService.find(user, data)
  }
  
}
