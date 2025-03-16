import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'date'
})
export class DatePipe implements PipeTransform {

  transform(value: string | Date, format: string = 'yyyy-MM-dd'): string {
    if (!value) return '';
    const date = new Date(value);
    return date.toISOString().split('T')[0];
  }

}
