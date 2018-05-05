import { FormControl } from '@angular/forms';

export class ValidationService {

    static getValidatorErrorMessage(validatorName: string, validatorValue?: any, name?: any) {
        let config = {
            'required': `${name}は必須です。`,
            'email': `${name}は正しいメール形式をご入力してください。`,
            'date': `${name}は正しい「Y-m-d」形式をご入力してください。`,
            'image': `${name}は正しい写真形式をご入力してください。`,
            'matchPassword': `${name}のは同じパスワードが必要です。`,
            'minlength': `${name}は${validatorValue.requiredLength}桁以上で入力してください。`,
            'maxlength': `${name}は${validatorValue.requiredLength}桁まで入力してください。`
        };

        return config[validatorName];
    }

    static email(control: FormControl) {
        // RFC 2822 compliant regex
        if (control.value.match(/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/)) {
            return null;
        }

        return { email: true };
    }

    static date(control: FormControl) {
        if (control.value.match(/^\d{4}-\d{2}-\d{2}$/)) {
            let d = new Date(control.value);

            if (d.toISOString().slice(0, 10) === control.value) {
                return null;
            }
        }

        return { date: true };
    }

    static image(control: FormControl) {
        if(control.value === '' || control.value === null) {
            return null;
        } 

        if(control.value instanceof File) {
            let types = ['image/png', 'image/jpeg', 'image/gif'];

            if(types.indexOf(control.value.type) !== -1) {
                return null;
            }
        }
        
        return { image: true };
    }

    static matchPassword(control: FormControl) {
        if (typeof control.parent != 'undefined') {
            if (control.value !== control.parent.controls['password'].value) {
                return { matchPassword: true };
            }
        }

        return null;
    }

}