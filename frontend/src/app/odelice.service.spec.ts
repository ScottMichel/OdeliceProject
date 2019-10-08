import { TestBed } from '@angular/core/testing';

import { OdeliceService } from './odelice.service';

describe('OdeliceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OdeliceService = TestBed.get(OdeliceService);
    expect(service).toBeTruthy();
  });
});
