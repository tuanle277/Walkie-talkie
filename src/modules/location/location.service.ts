import  { Location } from '../../entities'
import { LocationCreateDto, LocationUpdateDto } from './dto'
import { UserDto } from '../../dto'
import { LocationRepository } from 'src/repository'
import { Injectable } from '@nestjs/common'

@Injectable()
export class LocationService {
  constructor(
    private readonly locationRepository: LocationRepository,
  ) {}

  async createData(user: UserDto, data : LocationCreateDto) {
    let location = new Location()
    location.latitude = data.latitude
    location.longtitude = data.longtitude
    location.userId = data.userId

    await this.locationRepository.save(location)
    return { message: "CREATE_SUCCESS" }
  }

  async updateData(user: UserDto, data: LocationUpdateDto) {
    const location = await this.locationRepository.findOne({ where: { userId: data.userId  }})
    if (!location) {
      await this.createData(user, data);
    } else {
      location.longtitude = data.longtitude
      location.longtitude = data.longtitude
      await this.locationRepository.save(location)

    }
    return { message: "UPDATE_SUCCESS" }

  }
  async find(user, data: { id?: string }) {
    return await this.locationRepository.findBy(data)
  }

  // async updatePassword(user: UserDto, data: EmployeeUpdatePasswordDto) {
  //   if (data.newPassword !== data.confirmNewPassword) throw new Error('New password is not equal to Confirm new password.')

  //   const employee = await this.employeeRepository.findOne({ where: { id: data.id } })
  //   if (!employee) throw new Error(ERROR_NOT_FOUND_DATA)

  //   employee.updatedBy = user.id

  //   const userEntity = await this.userRepository.findOne({ where: { id: employee.userId } })
  //   if (!userEntity) throw new Error(ERROR_NOT_FOUND_DATA)

  //   userEntity.password = data.newPassword
  //   await this.userRepository.save(userEntity)

  //   return {
  //     message: 'Cập nhật mật khẩu thành công!',
  //   }
  // }
}
