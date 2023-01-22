import { IsNotEmpty, IsString, IsEmail, IsNumber } from 'class-validator'

export class LocationUpdateDto {
  @IsNumber()
  latitude: number

  @IsNumber()
  longtitude: number

  @IsString()
  userId: string
}
