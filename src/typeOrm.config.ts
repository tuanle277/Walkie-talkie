import { DataSource } from 'typeorm'
import { User, Location, Request } from './entities'

export default new DataSource({
    type: "cockroachdb",
    host: 'army-steer-8340.7tt.cockroachlabs.cloud',
    port: 26257,
    username: 'Boilermake',
    password: 'DU0qo5iyVCIVwg-ArRWw7A',
    database: 'defaultdb',
    // entities: [],
    // migrations: [],
    // subscribers: ["src/subscriber/**/*.ts"],
    // type: "cockroachdb",
    // url: "postgresql://dat:YjwnHPMkSgFalLf889JyFA@murky-lizard-8287.7tt.cockroachlabs.cloud:26257/Walkwithme?sslmode=verify-full", 
    ssl: { rejectUnauthorized: false }, 
    synchronize: true,
    logging: false,
    entities: [User, Location, Request],
    migrations: [],
    migrationsRun: true
})