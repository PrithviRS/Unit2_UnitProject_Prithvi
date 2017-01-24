class Entity
{
  private float _x;
  private float _y;
  private PImage _img;
  private String _type;
  private boolean _isActive;
  private Body _body;
  
  Entity()
  {
    _x = 0;
    _y = 0;
    _img  = null;
    _type = "Unknown Entity"; 
    _isActive = false;
  }
  
  Entity(float x, float y, PImage img, String type, boolean isActive)
  {
    _x = x;
    _y = y;
    _img  = img;
    _type = type;
    _isActive = isActive;
  }
  
  private void CreateBody(BodyType bType)
  {
    //This is the scalar size of the box that we're going to create
    // we can grab these from an image OR use typical width & height of rectangle
    int imgH = _img.height;
    int imgW = _img.width;
    
    
   
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    sd.setAsBox(box2dW, box2dH);
    

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 1;

   
    BodyDef bd = new BodyDef();
    bd.type = bType;
    
   
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
  }
  
  public void Draw()
  {
  
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
  
    float a = _body.getAngle();

    imageMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    image(_img, 0, 0);    
    popMatrix();              
  }
  
  private void CleanUpDeadObject()
  {
    box2d.destroyBody(_body);
   
  }



  boolean GetActive() { return _isActive; }
  void    SetActive(boolean state) { _isActive = state; }
  
  Vec2    GetPosition()    { return box2d.getBodyPixelCoord(_body); }
  Vec2    GetWorldCenter() { return _body.getWorldCenter(); } 
  void    SetPosition(float x, float y) { }
  
  String  GetType() { return _type; }
  
}