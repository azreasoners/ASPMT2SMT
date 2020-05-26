## Example Domains written as ASPMT Theories
Encodings in the language of Clingo and Clingcon are provided in addition to the ASPMT encodings except for the Bouncing Ball domain since neither is able to perform the continuous reasoning needed for this domain.

### Car Example (from the Texas Action Group discussion) 
A car is on a road of length L. If the accelerator is activated, the car will speed up with constant acceleration A until the accelerator is released or the car reaches its maximum speed MS, whichever comes first. If the brake is activated, the car will slow down with acceleration -A until the brake is released or the car stops, whichever comes first. Otherwise, the speed of the car remains constant. Generate a plan satisfying the following conditions: at duration 0, the car is at rest at one end of the road; at duration T, it should be at rest at the other end.

### Leaking Bucket
Consider a leaking bucket with maximum capacity c that loses one unit of water every time step by default. The bucket can be refilled to its maximum capacity by the action fill. The initial capacity is 5 and the desired capacity is 10. Here, the argument variable corresponding to the length of the plan increases so both systems suffer scalability issues.

### Bouncing Ball (from Chintabathina, 2008)
Consider an agent acting in a domain consisting of a ball. The ball is held above the ground by the agent. The actions available to the agent are drop and catch. Dropping the ball causes the height of the ball to change continuously with time as defined by Newton's laws of motion. As the ball accelerates towards the ground it gains velocity. If the ball is not caught before it reaches the ground it hits the ground with speed s and bounces up into the air with speed r * s where r = .95 is the rebound coefficient. The bouncing ball reaches a certain height and falls back towards the ground due to gravity. A robot is holding a ball at height 100k. We want to have the ball hit the ground and caught at height 50.

### Space Shuttle (from Lee, 2003)
A spacecraft is not affected by any external forces. It has two jets and the force that can be applied by each jet along each axis is at most 4k. The initial position of the rocket is (0,0,0) and it's initial velocity is (0,1,1). How can it get to (0,3k,2k) within 2 seconds? Assume the mass is 2.
