export interface IUser {
  email: string;
  username: string;
  token: string;
  roles: string[];
}

export interface IUserDetails {
  id: string;
  email: string;
  userName: string;
  fullName: string;
  phoneNumber: string;
  country: string;
  city: string;
  address: string;
  zipCode: string;
  registeredOn: string;
}

export interface IUserManagement {
  id: string;
  email: string;
  userName: string;
  fullName: string;
  roles: string[];
  registeredOn: string;
}
