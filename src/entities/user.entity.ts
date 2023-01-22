import { Column, CreateDateColumn, UpdateDateColumn, Entity, OneToOne, JoinColumn, ManyToOne, OneToMany } from 'typeorm'
import { BaseEntity } from './base.entity'
import { Location, Request } from './'


@Entity()
export class User extends BaseEntity{

  @Column({
    type: 'varchar',
    length: 500,
    nullable: true,
  })
  name: string

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
  })
  username: string

  @Column({
    name: 'password',
    type: 'text',
    nullable: true,
  })
  password: string

  @Column({
    type: 'varchar',
    length: 50,
    nullable: true,
  })
  email: string

  @Column({
    type: 'varchar',
    length: 500,
    nullable: true,
  })
  address: string

  @Column({
    type: 'varchar',
    nullable: true,
  })
  locationId: string
  @OneToOne(() => Location, (p) => p.user)
  @JoinColumn({ name: 'locationId', referencedColumnName: 'id' })
  location: Promise<Location>
  

  @Column({
    type: 'varchar',
    nullable: true,
  })
  requestId: string
  @OneToMany(() => Request, (p) => p.user)
  @JoinColumn({ name: 'requestId', referencedColumnName: 'id' })
  request: Promise<Location>
  
  @Column({
    type: 'varchar',
    length: 36,
    nullable: true,
  })
  updatedBy: string

  @CreateDateColumn()
  createdAt: Date

  @UpdateDateColumn()
  updatedAt: Date

}
