import { Column, Entity, OneToOne, JoinColumn } from 'typeorm'
import { BaseEntity } from './base.entity'
import { User } from './user.entity'


@Entity()
export class Location extends BaseEntity{

  @Column({
    type: 'varchar',
    nullable: true,
  })
  userId: string
  @OneToOne(() => User, (p) => p.location)
  @JoinColumn({ name: 'userId', referencedColumnName: 'id' })
  user: Promise<User>

  @Column({
    type: 'decimal',
    precision: 5,
    nullable: true,
  })
  longtitude: number

  @Column({
    type: 'decimal',
    precision: 5,
    nullable: true,
  })
  latitude: number

}
