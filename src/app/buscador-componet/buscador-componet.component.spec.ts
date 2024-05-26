import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BuscadorComponetComponent } from './buscador-componet.component';

describe('BuscadorComponetComponent', () => {
  let component: BuscadorComponetComponent;
  let fixture: ComponentFixture<BuscadorComponetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [BuscadorComponetComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(BuscadorComponetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
