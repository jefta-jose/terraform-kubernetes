export interface IMovie {
    id: string;
    name: string;
    description: string;
    releaseDate: string;
    genreId: string;
    genre?: {id: string, name: string};
}