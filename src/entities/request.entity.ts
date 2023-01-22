import { Column, CreateDateColumn, UpdateDateColumn, Entity, OneToOne, JoinColumn, OneToMany, ManyToOne } from 'typeorm'
import { BaseEntity } from './base.entity'
import { User } from './user.entity'

@Entity()
export class Request extends BaseEntity{

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
  })
  nameRequester: string
  
  @Column({
    type: 'varchar',
    nullable: true,
  })
  userId: string
  @ManyToOne(() => User, (p) => p.request)
  @JoinColumn({ name: 'userId', referencedColumnName: 'id' })
  user: Promise<User>
  
  @Column({
    type: 'varchar',
    length: 500,
    nullable: true,
  })
  address: string

  @Column({
    type: 'varchar',
    length: 36,
    nullable: true,
  })
  updatedBy: string

  @Column({
    type: 'varchar',
    length: 500,
    nullable: true,
  })
  user1: string

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
  })
  user2: string

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
  })
  user3: string

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
  })
  user4: string

}
