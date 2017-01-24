class Player extends Entity
{
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyJump;
  private PVector _moveSpeed;
  private int     _jumpStrength;
  
  Player(float x, float y, PImage img, boolean isActive)
  {
    super(x, y, img, "Player", isActive);
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(50,0);
    
    
 
    _jumpStrength = 20000;
  }
  
  public void Update()
  {
    KeyInputs();
    HandleMovement();
  }
  
  private void KeyInputs()
  {
    if (keyPressed)
    {
      if (key == 'd')
      {
        _keyRight = true;
      }
      if (key == 'a')
      {
        _keyLeft = true;
      }
      if (key == 'w')
      {
        _keyJump = true;
      }
    }
    else
    {
      _keyLeft  = false;
      _keyRight = false;
      _keyJump  = false;
    }
  }
  
  private void HandleMovement()
  {
   

    Vec2 currentVelocity = super._body.getLinearVelocity();
    
    
   
    if (_keyRight)
    {
      currentVelocity.x = 1 * _moveSpeed.x;
    }
    else if (_keyLeft)
    {
      currentVelocity.x = -1 * _moveSpeed.x;
    }
    else
    {
      currentVelocity.x = 0;
    }
    super._body.setLinearVelocity(currentVelocity);
    
 
    
    if (_keyJump && currentVelocity.y < 1 && currentVelocity.y > -1)
    {
       _moveSpeed.y = _jumpStrength;
       super._body.applyLinearImpulse( new Vec2(0, _jumpStrength), super.GetWorldCenter(), false);
    }
  }
}