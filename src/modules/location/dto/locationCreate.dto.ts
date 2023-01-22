import { IsNumber, IsString } from 'class-validator'

export class LocationCreateDto {
  @IsNumber()
  latitude: number

  @IsNumber()
  longtitude: number

  @IsString()
  userId: string
  
}
