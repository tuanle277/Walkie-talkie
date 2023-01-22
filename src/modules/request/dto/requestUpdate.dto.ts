import { IsNotEmpty, IsString, IsEmail } from 'class-validator'

export class RequestUpdateDto {
  
  @IsString()
  @IsNotEmpty()
  id: string

  @IsString()
  name: string

}

