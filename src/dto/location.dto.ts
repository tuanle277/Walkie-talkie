import { IsUUID, IsString, IsDate, IsNumber } from 'class-validator'

export class LocationDto {
  @IsUUID()
  id: string

  @IsNumber()
  longtitude: number

  @IsNumber()
  latitude: number

  @IsString()
  userId: string

  @IsDate()
  createdAt: Date

  @IsDate()
  updatedAt: Date
  
}
