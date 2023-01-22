import { IsNotEmpty, IsString, IsNumber } from 'class-validator'

export class RequestCreateDto {
  @IsNotEmpty()
  @IsString()
  address: string

  @IsNotEmpty()
  @IsString()
  userId: string

  @IsNumber()
  latitude: number

  @IsNumber()
  longtitude: number

}
